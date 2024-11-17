class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :playerID
      t.integer :winnerID
      t.integer :winningScore

      t.timestamps
    end

    add_index :games, [:playerID]
  end
end
