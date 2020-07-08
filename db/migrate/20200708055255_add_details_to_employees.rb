class AddDetailsToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :email_address, :string
    add_column :employees, :phone, :string
  end
end
