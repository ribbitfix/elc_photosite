class AddProcessingToImages < ActiveRecord::Migration
  def change
    add_column :images, :processing, :boolean
  end
end
