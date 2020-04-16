class CreateSearch < ActiveRecord::Migration[5.2]
  def change
    create_table :search do |t|
      t.string :search_param
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
