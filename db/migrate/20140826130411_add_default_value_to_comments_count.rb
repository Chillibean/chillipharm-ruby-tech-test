class AddDefaultValueToCommentsCount < ActiveRecord::Migration[5.0]
  def change
    change_column :assets, :comments_count, :integer, :default => 0
  end
end
