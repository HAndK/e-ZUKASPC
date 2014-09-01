Rails.application.routes.draw do
  get '/auth/twitter/callback', :to => 'sessions#create'
  resources :tags, :only => [:index, :show, :new, :create]
  mount Tag::API => '/tags'
  
  root :to => "tags#new"
end
