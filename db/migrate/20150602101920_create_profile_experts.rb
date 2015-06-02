class CreateProfileExperts < ActiveRecord::Migration
  def change
    create_table :profile_experts do |t|
      t.string :first_name
      t.string :last_name
      t.string :skype
      t.text :about
      t.integer :free_question

      t.timestamps null: false
    end
  end
end
