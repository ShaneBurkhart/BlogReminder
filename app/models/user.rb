class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :blogs

  def my_blog?(blog)
    self.blogs.each do |b|
      return true if b.id == blog.id
    end
    false
  end

  def my_planned_date?(date)
    dates = self.blogs.map do |blog|
      blog.planned_dates
    end
    dates.flatten!
    dates.each do |d|
      return true if d.id == date.id
    end
    false
  end

  def planned_dates
    dates = self.blogs.map do |blog|
      blog.planned_dates
    end
    dates.flatten!
  end

  def self.avatar_url email
    hash = Digest::MD5.hexdigest(email.strip)
    "http://www.gravatar.com/avatar/#{hash}?s=200&d=mm"
  end

end
