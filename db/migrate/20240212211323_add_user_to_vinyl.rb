class AddUserToVinyl < ActiveRecord::Migration[7.1]
  def change
    add_reference :vinyls, :user, null: false, foreign_key: true
  end
end
