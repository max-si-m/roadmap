Rails.application.routes.draw do
  resources :comments
  resources :users
  resources :posts do
    collection do
      get 'some_static'
    end
  end

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
