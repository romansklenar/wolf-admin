ActiveAdmin.register User do
  decorate_with UserDecorator

  menu priority: 100
  # actions :all, except: [:new]

  permit_params :first_name, :last_name, :full_name, :email, :password, :password_confirmation, :locale, :time_zone, :role

  filter :first_name
  filter :last_name
  filter :email
  filter :locale, as: :select, collection: -> { User::LOCALE_PAIRS.invert }
  filter :time_zone, as: :select, collection: -> { time_zone_options_for_select(params[:q].fetch(:time_zone_eq)) }
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  index do
    selectable_column
    id_column
    column :email
    column :full_name
    column :locale
    column :time_zone
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :full_name
      row :email
      row :locale
      row :time_zone
      row :role

      # Timestamps
      row :created_at
      row :updated_at
    end

    panel I18n.t("active_admin.panels.login_details"), collapsed: true do
      attributes_table_for user.decorate do
        # Trackable
        row :current_sign_in_at
        row :current_sign_in_ip
        row :last_sign_in_at
        row :last_sign_in_ip
        row :sign_in_count

        ## Recoverable
        row :reset_password_token
        row :reset_password_sent_at

        ## Rememberable
        row :remember_created_at
        
        ## Recoverable
        row :reset_password_token
        row :reset_password_sent_at
        
        ## Confirmable
        row :confirmation_token
        row :confirmed_at
        row :confirmation_sent_at
        row :unconfirmed_email

        ## Lockable
        row :failed_attempts
        row :unlock_token
        row :locked_at
      end
    end
  end

  form do |f|
    f.inputs title: :user_details do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :locale, as: :select, collection: User::LOCALE_PAIRS.invert, prompt: true
      f.input :time_zone, as: :select, collection: time_zone_options_for_select(f.object.time_zone), prompt: true
      f.input :role, as: :select, collection: User::ROLE_PAIRS.invert, prompt: true
    end
    
    f.inputs title: :user_password do
      f.input :password
      f.input :password_confirmation
    end if f.object == current_administrator || f.object.new_record?
    
    f.actions
  end


  action_item :reset_password, only: [:show, :edit], if: -> { current_user.has_role?(:administrator) } do
    title = I18n.t("active_admin.buttons.user.reset_password")
    link_to(title, reset_password_admin_user_path(user))
  end

  member_action :reset_password do
    resource.send_reset_password_instructions
    redirect_to :back, notice: I18n.t("flash.users.reset_password.notice", count: 1, resource_name: resource_class.model_name.human)
  end

  batch_action :reset_password, priority: 5 do |selection|
    User.find(selection).each { |user| user.send_reset_password_instructions }
    redirect_to :back, notice: I18n.t("flash.users.reset_password.notice", count: selection.size, resource_name: resource_class.model_name.human(count: selection.size))
  end


  action_item :become, only: [:show, :edit], if: -> { current_user.has_role?(:administrator) } do
    link_to I18n.t("active_admin.buttons.user.become"), become_admin_user_path(resource)
  end

  member_action :become do
    sign_in resource, bypass: true
    redirect_to after_sign_in_path_for(resource), notice: I18n.t("flash.users.sessions.become_user", user: resource.display_name)
  end

end
