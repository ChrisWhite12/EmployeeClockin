class RemoveDetailsFromReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :report_time, :string
    remove_column :reports, :report_date, :string
  end
end
