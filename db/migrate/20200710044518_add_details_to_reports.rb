class AddDetailsToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :report_time_in, :string
    add_column :reports, :report_time_out, :string
    add_column :reports, :report_date_in, :string
    add_column :reports, :report_date_out, :string
  end
end
