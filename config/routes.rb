Rails.application.routes.draw do
  resources :hatches

  root 'hatches#new'
end
