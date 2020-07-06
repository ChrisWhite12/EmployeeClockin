class AddEmployeeToCard < ActiveRecord::Migration[6.0]
  def change
    add_reference :cards, :employee, null: false, foreign_key: true
  end
end
