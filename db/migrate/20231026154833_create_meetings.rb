class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :status
      t.string :category
      t.string :other
      t.date :date
      t.string :name
      t.integer :contact
      t.string :email
      t.date :preffered_date

      t.timestamps
    end
  end
end
