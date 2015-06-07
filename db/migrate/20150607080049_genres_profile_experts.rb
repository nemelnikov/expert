class GenresProfileExperts < ActiveRecord::Migration
  def change
  	create_table :genres_profile_experts, id: false do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :profile_expert, index: true
    end
  end
end
