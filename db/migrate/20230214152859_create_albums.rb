class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.text :title
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
