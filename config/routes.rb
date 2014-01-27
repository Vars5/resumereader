Resumereader::Application.routes.draw do

  #Root to public home page unless signed in
  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'
  
  #Public Pages
  match '/about', :to => 'staticpages#about'
  match'/invite', to: 'staticpages#invite'
  match '/invitable', to: 'staticpages#invitable'
  #match '/updates', to: 'staticpages#updates'
  
  #api (test)
  resources :api

  match '/upvoted_comments', :to => 'dashboards#upvoted_comments'
  
  #admin pages
  match '/admin', to: 'dashboards#admin'  
  
  #suggestions & bugs
  match '/suggestions', to: 'problems#new'
  
  #Resources
  #resources :schools, except: [:show] 
  resources :settings, except: [:index, :new, :edit]
  resources :questions, except: [:new]
  resources :companies
  resources :posts, except: [:new]
  resources :notes, only: [:create, :update, :destroy]
  resources :searches  
  resources :categories
  resources :roles
  resources :industries
  resources :answers, only: [:create, :update, :destroy]
  
  resources :follows, only: [:create, :destroy]
  
  resources :comments
  
  resources :discussions
  
  mount Split::Dashboard, at: 'split'

  put '/comments/:id/:action' => 'comments#upvote'
  put '/comments/:id/:action' => 'comments#downvote'  

=begin  
  resources :comments do 
    member do 
      put 'like', to: "comments#upvote"
      put 'dislike', to: 'comments#downvote'
    end
  end
=end  
  
  #Devise gem for users and their accounts
  devise_for :users, :controllers => {registrations: 'registrations'}

  #error pages
  #match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/} # via: :all

  resources :comments do
    get :autocomplete_company_name, :on => :collection
  end

end


