class AddNilToComments < ActiveRecord::Migration[7.0]
  def change
    change_column_null :subscriptions, :user_id, true
  end
end
