class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true
      t.string     :first_name
      t.string     :last_name
      t.string     :email
      t.string     :avatar_url
      t.string     :provider, index: true
      t.string     :uid
      t.string     :secret
      t.text       :token
      t.text       :raw_info
      t.timestamps null: false
    end
  end
end
