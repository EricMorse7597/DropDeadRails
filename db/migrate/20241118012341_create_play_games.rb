class CreatePlayGames < ActiveRecord::Migration[7.0]
  def change
    create_table :play_games do |t|
      t.integer :side
      t.integer :player_count
      t.integer :dice_count

      t.timestamps
    end
  end
end
