class AddPhotoToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :photo, :attachment
  end
end
