class AddUserToMessages < ActiveRecord::Migration[7.0]
  def up
    add_reference :messages, :user, null: false, foreign_key: true
  end

  def down
    remove_reference :messages, :user, index: true
  end
end
