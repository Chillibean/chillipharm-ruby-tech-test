class AddCreatorToLibrary < ActiveRecord::Migration[5.0]
  def change
    add_column :libraries, :creator_id, :integer
  end
end
