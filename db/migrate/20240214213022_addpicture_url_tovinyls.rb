class AddpictureUrlTovinyls < ActiveRecord::Migration[7.1]
  def change
    add_column :vinyls, :picture_url, :string
  end
end
