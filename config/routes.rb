BlogPlanner::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users
  resource :user, only: ["show"]

  resources :blogs do
    resources :dates
  end

  #get "/app" => "app#show"
  namespace :api do
    #resources :blogs
  end
end
