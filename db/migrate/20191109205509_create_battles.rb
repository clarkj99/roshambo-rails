class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      t.integer :evolution_level
      t.references :battlefield, null: false, foreign_key: true

      t.timestamps
    end
  end
end
