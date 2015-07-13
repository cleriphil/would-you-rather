class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :description_a, :string
      t.attachment :image_a
      t.column :votes_a, :integer
      t.column :description_b, :string
      t.attachment :image_b
      t.column :votes_b, :integer
      t.timestamps
    end
  end
end
