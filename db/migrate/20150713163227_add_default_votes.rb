class AddDefaultVotes < ActiveRecord::Migration
  def change
    change_column :questions, :votes_a, :integer, :default => 0
    change_column :questions, :votes_b, :integer, :default => 0
  end
end
