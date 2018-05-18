Rails.application.routes.draw do
 
  
 

 
  
  get 'accepts/show'
resources :accepts
get '/accept_invitations/:id', to: 'accept_invitations#accepted'
  resources :users, only: [:new, :create, :index, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :invitations

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  resources :user_steps

  constraints RoleRouteConstraint.new { |current_user |   current_user.id != nil} do
    root to: 'users#show'
    resources :organizations do 
    resources :teams 
  end
get '/accept_invitations/:id', to: 'accept_invitations#accepted'
  resources :teams do
     resources :teaminvites
   end
  #get '/accept_invitations/:id', to: 'accept_invitations#accepted', as: 'accepted'
  resources :learningstyles
   resources :learningstyle_steps
     delete '/logout',  to: 'sessions#destroy'
  get '/logout',  to: 'sessions#destroy'
  resources :users, only: [:edit, :update, :index] do
   resources :organizations
 end

  end

   root to: 'sessions#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
