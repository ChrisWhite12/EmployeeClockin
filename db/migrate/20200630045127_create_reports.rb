class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :report_time
      t.string :report_date
      t.string :report_type

      t.timestamps
    end
  end
end
