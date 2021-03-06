Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }

  resources :products do
    resources :comments
  end
  resources :users
  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/landing_page'
  post 'simple_pages/thank_you'
  root 'simple_pages#landing_page'
  post 'payments/create'

  resources :orders, only: %i[index show create destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
end
