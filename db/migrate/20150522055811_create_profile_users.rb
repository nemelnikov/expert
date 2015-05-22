class CreateProfileUsers < ActiveRecord::Migration
  def change
    create_table :profile_users do |t|
      t.belongs_to :user, index: true
      t.string :first_name
      t.string :last_name
      t.string :skype
      t.boolean :admin, default: false

      t.timestamps null: false
    end
    add_foreign_key :profile_users, :users
  end
end
