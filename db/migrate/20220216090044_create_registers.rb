class CreateRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :registers do |t|
      t.string :name_room
      t.text :int_room
      t.integer :price
      t.string :adress
      t.string :img_room

      t.timestamps
    end
  end
end
