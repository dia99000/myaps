Rails.application.routes.draw do
  devise_for :users
  get '/top' => 'top#home'
  get '/about' => 'top#about'
  resources :colors, only: :create
  resources :cards do
  	resources :descriptions, only: [:create, :update, :destroy]
    post 'add' => 'cardfavs#create'
    delete '/add' => 'cardfavs#destroy'
  end
  resources :tags
  resources :todos, only: [:index, :create, :update, :destroy]

  root to: 'cards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

#    Prefix Verb   URI Pattern       Controller#Action

#     cards GET    /cards            cards#index
#           POST   /cards            cards#create
#  new_card GET    /cards/new        cards#new
# edit_card GET    /cards/:id/edit   cards#edit
#      card GET    /cards/:id        cards#show
#           PATCH  /cards/:id        cards#update
#           PUT    /cards/:id        cards#update
#           DELETE /cards/:id        cards#destroy
