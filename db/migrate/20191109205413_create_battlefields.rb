class CreateBattlefields < ActiveRecord::Migration[6.0]
  def change
    create_table :battlefields do |t|
      t.string :name

      t.timestamps
    end
  end
end
