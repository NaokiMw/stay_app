class AddTopfeeToReserves < ActiveRecord::Migration[6.1]
  def change
    add_column :reserves, :totalfee, :integer
  end
end
