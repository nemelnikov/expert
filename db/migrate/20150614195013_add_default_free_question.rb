class AddDefaultFreeQuestion < ActiveRecord::Migration
  def change
  	change_column_default :profile_experts, :free_questions, 10
  end
end
