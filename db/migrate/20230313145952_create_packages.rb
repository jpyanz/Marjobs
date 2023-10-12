class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.decimal :price
      t.string :category
      t.text :description
      t.text :freebies

      t.timestamps
    end
  end
end
