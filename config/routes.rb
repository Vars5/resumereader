Resumereader::Application.routes.draw do


  get "articles/new"

  get "articles/edit"

  get "articles/show"

  get "articles/index"

  #Root to public home page unless signed in
  
  #Save time annd just root to new registration page for now
  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }

  devise_scope :user do
    root to: "devise/registrations#new"
  end


  #root :to => 'staticpages#home'
  
  #Public Pages
  match '/feedback', :to => 'staticpages#feedback'
  match '/about', :to => 'staticpages#about'
  
  #User's Signed In Pages
  #match '/resumeQuestions', :to => 'dashboards#resumeQuestions'
  #match '/resume', :to => 'dashboards#resume'
  match '/changeSettings', :to => 'dashboards#changeSettings'
  
  #admin pages
  match '/admin', to: 'dashboards#admin'
  
  #knowledge base
  match '/knowledgebase', to: 'articles#index'
  
  #Resources
  #resources :schools, except: [:show] 
  resources :problems, only: [:create, :index]
  resources :settings, except: [:index, :new, :edit]
  resources :questions
  resources :companies
  resources :jobs, except: [:new]
  resources :boards, except: [:new]
  resources :posts, except: [:new]
  resources :app_lists, except: [:new]
  resources :notes, only: [:create, :update, :destroy]
  
  resources :questions
  resources :articles
  
  resources :searches
  #resources :employments do
  #  resources :bullets
  #  resources :responses
  #end

  #resources :extracurriculars do
  #  resources :bullets
  #  resources :responses
  #end
  
  #Devise gem for users and their accounts
  devise_for :users

  #error pages
  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/} # via: :all



end


