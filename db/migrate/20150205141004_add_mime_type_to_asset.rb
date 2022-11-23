class AddMimeTypeToAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :mime_type, :string
  end
end
