Rails.application.routes.draw do
  get '/auth/twitter/callback', :to => 'sessions#create'
  resources :tags, :only => [:index, :show]
  mount Tag::API => '/tags'
end
