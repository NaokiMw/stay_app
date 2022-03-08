class AddImageIdToRegisters < ActiveRecord::Migration[6.1]
  def change
    add_column :registers, :image_id, :string
  end
end
