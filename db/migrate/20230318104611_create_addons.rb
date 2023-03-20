class CreateAddons < ActiveRecord::Migration[7.0]
  def change
    create_table :addons do |t|
      t.text :name
      t.decimal :price

      t.timestamps
    end
  end
end
