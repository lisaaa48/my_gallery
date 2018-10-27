Rails.application.routes.draw do

  root 'works#index'

  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        registrations: 'admins/registrations',
        passwords: 'admins/passwords'
      }
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gallery, only:[:index, :show], controller: 'works'

  resources :search, controller: 'periods', only:[:index]

  resources :users do
    resources :my_gallery, except:[:new, :create], controller: 'my_galleries' do
      member do
        delete :withdraw
        post :add_gallery
      end
    end
    resources :visits, only:[:index, :update, :destroy] do
      member do
        post :add_visit
        post :pin_map
        delete :withdraw
      end
    end
  end

  namespace :admin do
    resources :users, only:[:index]
    resources :works, except:[:show]
    resources :holders, only:[:new, :create]
  end

end
