class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.integer :current_level
      t.references :player, null: false, foreign_key: true
      t.references :battlefield, null: false, foreign_key: true
    end
  end
end
