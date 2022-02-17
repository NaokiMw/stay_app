class RemoveImgRoomFromRegisters < ActiveRecord::Migration[6.1]
  def change
    remove_column :registers, :img_room, :string
  end
end
