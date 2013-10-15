class PlannedDate < ActiveRecord::Base
  attr_accessible :blog_id, :content, :planned_date

  belongs_to :blog
end
