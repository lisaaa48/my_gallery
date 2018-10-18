Rails.application.routes.draw do

  root 'works#index'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gallery, controller: 'works'

  resources :search, controller: 'periods', only:[:index]

  resources :users do
    resources :my_gallery, controller: 'my_galleries' do
      member do
        delete :withdraw
        post :add_gallery
      end
    end
    resources :visits do
      member do
        post :add_visit
      end
    end
  end

  namespace :admin do
    resources :users
    resources :works
    resources :admins
  end

  resources :holders, only:[:new, :create]

end
