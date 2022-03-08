class RenameRoomIdColumnToRegisters < ActiveRecord::Migration[6.1]
  def change
    rename_column :reserves, :room_id, :register_id
  end
end
