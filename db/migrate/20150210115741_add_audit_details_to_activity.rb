class AddAuditDetailsToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :ip, :string
    add_column :activities, :browser, :string
  end
end