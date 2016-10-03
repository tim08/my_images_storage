class AddUserIdToImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :user, foreign_key: true
  end
end
