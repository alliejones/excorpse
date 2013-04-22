class AddImageToGames < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.attachment :image
    end
  end
end
