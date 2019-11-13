# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :display_name
      t.integer :current_level, default: 0
      t.string :password_digest

      t.timestamps
    end
  end
end
