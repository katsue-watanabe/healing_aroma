class AddMenuToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :menu, :string
  end
end
