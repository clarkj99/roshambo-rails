class AddCurrentLevelToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :current_level, :integer
  end
end
