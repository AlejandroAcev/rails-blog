Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "inicio#index"
  resources :articles

  get "/prueba" => "inicio#prueba"
  get "/articulos" => "article#index"

end
