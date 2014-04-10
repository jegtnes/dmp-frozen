Dmp::Application.routes.draw do

  resources :journey

  root to: 'search#index'
end
