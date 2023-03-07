class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :package
      t.date :date
      t.string :name
      t.integer :phone
      t.text :email
      t.text :venue
      t.text :addons
      t.text :string

      t.timestamps
    end
  end
end
