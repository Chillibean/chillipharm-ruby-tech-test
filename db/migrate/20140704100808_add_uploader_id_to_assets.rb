class AddUploaderIdToAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :uploader_id, :integer

    add_index :assets, :uploader_id
  end
end