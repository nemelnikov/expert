class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :question_description
      t.belongs_to :profile_user, index: true
      t.belongs_to :profile_expert, index: true
      t.string :question_type
      t.belongs_to :genre, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :profile_users
    add_foreign_key :questions, :profile_experts
    add_foreign_key :questions, :genres
  end
end
