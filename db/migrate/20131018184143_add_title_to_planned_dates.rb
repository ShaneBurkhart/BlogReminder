class AddTitleToPlannedDates < ActiveRecord::Migration
  def change
    add_column :planned_dates, :title, :string
  end
end
