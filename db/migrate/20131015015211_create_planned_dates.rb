class CreatePlannedDates < ActiveRecord::Migration
  def change
    create_table :planned_dates do |t|
      t.date :planned_date
      t.string :content
      t.integer :blog_id

      t.timestamps
    end
  end
end
