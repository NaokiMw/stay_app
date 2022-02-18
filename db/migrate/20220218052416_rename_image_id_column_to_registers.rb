class RenameImageIdColumnToRegisters < ActiveRecord::Migration[6.1]
  def change
    rename_column :registers, :image_id, :image
  end
end
