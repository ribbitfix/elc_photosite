class AddForeignKeyToImage < ActiveRecord::Migration
  def change
    add_column :images, :images, :string
    add_column :images, :user_id, :integer
  end
end
