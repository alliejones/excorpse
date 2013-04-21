class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :game_index
      t.string :type
      t.text :contents

      t.timestamps
    end
  end
end
