class ChangeIntegerLimitInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :phone, :integer, limit: 8
  end
end
