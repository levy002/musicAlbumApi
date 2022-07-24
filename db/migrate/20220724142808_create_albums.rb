class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :photo
      t.string :artistName
      t.string :published
      t.string :label

      t.timestamps
    end
  end
end
