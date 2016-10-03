Rails.application.routes.draw do
  root 'albums#index'
  devise_for :users
  resources :albums do
    get 'download', on: :member
    resources :images
  end
  namespace :api, :defaults => {:format => :json}  do
    resources :albums, except: [:new, :edit] do
      resources :images, except: [:new, :edit]
    end
  end
end
