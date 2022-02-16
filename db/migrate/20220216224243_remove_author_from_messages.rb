class RemoveAuthorFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :author
  end
end
