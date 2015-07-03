class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :question, index: true
      t.text :message_body

      t.timestamps null: false
    end
    add_foreign_key :messages, :questions
  end
end
