Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  post "/leave/:id/approve" => "leave#approve", as: :approve
  post "leave/:id/reject" =>  "leave#reject", as: :reject
  post "leave/:id/alloted_leaves" => "leave#alloted_leaves" , as: :alloted
  resources :leave
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
