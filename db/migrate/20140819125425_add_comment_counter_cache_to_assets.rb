class AddCommentCounterCacheToAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :comments_count, :integer
  end
end
