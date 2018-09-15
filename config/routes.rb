Rails.application.routes.draw do
  get '/' => 'top#home'
  get '/about' => 'top#about'
  resources :cards
  resources :tags, only: [:index, :show, :create, :destroy] do
  	collection{ get "search"}
  end
  root to: 'top#home'
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
