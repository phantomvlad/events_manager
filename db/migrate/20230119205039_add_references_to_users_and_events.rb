class AddReferencesToUsersAndEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :photo
    add_reference :users, :photo
  end
end
