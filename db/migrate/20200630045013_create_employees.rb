class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.float :hrrate
      t.string :card_status

      t.timestamps
    end
  end
end
