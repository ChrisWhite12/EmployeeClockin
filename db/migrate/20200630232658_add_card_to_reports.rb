class AddCardToReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :card, null: false, foreign_key: true
  end
end
