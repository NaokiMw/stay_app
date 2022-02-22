class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.datetime :start_day
      t.datetime :end_day
      t.integer :guest
      t.integer :fee
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
