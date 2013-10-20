class PlannedDate < ActiveRecord::Base
  attr_accessible :blog_id, :content, :date, :title

  belongs_to :blog
end
