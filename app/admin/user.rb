ActiveAdmin.register User do
  decorate_with UserDecorator

  menu priority: 100
  actions :all, except: [:new]

  permit_params :name, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email

      # Timestampable
      row :created_at
      row :updated_at
    end

    panel I18n.t("active_admin.panels.login_details"), collapsed: true do
      attributes_table_for user.decorate do
        # trackable
        row :current_sign_in_at
        row :current_sign_in_ip
        row :last_sign_in_at
        row :last_sign_in_ip
        row :sign_in_count

        # rememberable
        row :remember_created_at
      end
    end
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
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
