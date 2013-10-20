class ChangePlannedDateToDateInPlannedDates < ActiveRecord::Migration
  def up
    rename_column :planned_dates, :planned_date, :date
  end

  def down
    rename_column :planned_dates, :date, :planned_date
  end
end
