class CreateVinyls < ActiveRecord::Migration[7.1]
  def change
    create_table :vinyls do |t|
      t.string :title
      t.text :description
      t.string :artist
      t.string :genre
      t.boolean :availability
      t.float :price

      t.timestamps
    end
  end
end
