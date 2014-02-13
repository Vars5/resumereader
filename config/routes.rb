Resumereader::Application.routes.draw do

  #Root to public home page unless signed in
  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'
  
  
  #test homepages - temporary
  match '/test1', :to => 'staticpages#test1'
  match '/test2', :to => 'staticpages#test2'
  
  #Public Pages
  match '/about', :to => 'staticpages#about'
  match'/invite', to: 'staticpages#invite'
  match '/invitable', to: 'staticpages#invitable'
  #match '/updates', to: 'staticpages#updates'
  match '/industry_advice', to: 'industries#industry_advice'
  
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
  resources :questions
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

  
  #Devise gem for users and their accounts
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: [:show] #This line needs to be below devise_for :users 

  resources :comments do
    get :autocomplete_company_name, :on => :collection
  end

  match'/onboarding', to: 'dashboards#onboarding'
end



