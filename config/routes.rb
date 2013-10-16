BlogPlanner::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users
  resource :user, only: ["show"]

  resources :blogs, except: [] do
    resources :dates, except: ["index", "show"]
  end

  #get "/app" => "app#show"
  namespace :api do
    #resources :blogs
  end
end
