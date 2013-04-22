class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :game_index
      t.text :contents
      t.attachment :image

      t.timestamps
    end
  end
end
