class AddCreatorToBattlefields < ActiveRecord::Migration[6.0]
  def change
    add_column :battlefields, :creator_id, :integer
  end
end
