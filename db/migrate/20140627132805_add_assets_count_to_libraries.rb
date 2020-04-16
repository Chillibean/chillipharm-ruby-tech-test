class AddAssetsCountToLibraries < ActiveRecord::Migration[5.0]
  def change
    add_column :libraries, :assets_count, :integer, default: 0
  end
end
