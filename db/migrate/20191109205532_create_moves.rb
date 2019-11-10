class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :symbol
      t.references :player, null: false, foreign_key: true
      t.references :battle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
