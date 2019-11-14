class CreateAcMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :ac_messages do |t|
      t.text :content

      t.timestamps
    end
  end
end
