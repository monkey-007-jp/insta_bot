Rails.application.routes.draw do
  root "users#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  devise_scope :user do
    get "/users/sign_out" => "users/sessions#destroy"
  end

  resources :users, only: %i[index destroy] do
    get :top, on: :collection
    get :set, on: :member
    get :history, on: :collection
    get :change, on: :member
    get :user_policy, on: :collection
    get :privacy_policy, on: :collection
    get :asct, on: :collection
    get :line_contact, on: :collection
    get :management, on: :collection
    get :activity, on: :member
    get :analytics, on: :collection
    
    # get "/instabot/sign_in" => "instabots#index", on: :member
    # post "/instabot/sign_in" => "instabots#create", on: :member
  end
  resources :instabots, only: %i[index create]
end
