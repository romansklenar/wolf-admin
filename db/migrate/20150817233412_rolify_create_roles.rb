class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, index: true
      t.references :resource, polymorphic: true
      t.timestamps

      t.index [:name, :resource_type, :resource_id]
    end

    create_join_table :users, :roles, table_name: 'users_roles' do |t|
      t.index [:user_id, :role_id], unique: true
      t.timestamps
    end
  end
end
