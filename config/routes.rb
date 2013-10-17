BlogPlanner::Application.routes.draw do

  get "about/index"

  get "faq/index"

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users
  resource :user, only: ["show"]

  resources :blogs, except: [] do
    resources :planned_dates, except: ["index", "show"]
  end

  #get "/app" => "app#show"
  # namespace :api do
    #resources :blogs
  # end
end
