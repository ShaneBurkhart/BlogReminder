class ChangeContentToTextInPlannedDates < ActiveRecord::Migration
  def up
    change_column :planned_dates, :content, :text
  end

  def down
    change_column :planned_dates, :content, :string
  end
end
