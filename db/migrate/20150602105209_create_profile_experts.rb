class CreateProfileExperts < ActiveRecord::Migration
  def change
    create_table :profile_experts do |t|
      t.string :first_name
      t.string :last_name
      t.string :skype
      t.text :about
      t.integer :free_questions
      t.belongs_to :ask_expert, index: true

      t.timestamps null: false
    end
    add_foreign_key :profile_experts, :ask_experts
  end
end
