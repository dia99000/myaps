Rails.application.routes.draw do
  get '/' => 'top#home'
  get '/about' => 'top#about'
  root to: 'top#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
