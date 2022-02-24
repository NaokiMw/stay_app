class ChangeDataReserveToStartDay < ActiveRecord::Migration[6.1]
  def change
    change_column :reserves, :start_day, :date
    change_column :reserves, :end_day, :date

  end
end
