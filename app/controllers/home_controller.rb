class HomeController < ApplicationController
  def index
    redirect_to blogs_path if current_user
  end
end
