class AddSettingsToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :settings, :string
  end
end
