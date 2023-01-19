class AddPhotoToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :photo, :string
  end
end
