class AddSockToComments < ActiveRecord::Migration
  def change
    add_column :comments, :sock, :string
  end
end
