Resumereader::Application.routes.draw do

  #Root to public home page unless signed in
  

  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'

  #root :to => 'staticpages#home'
  
  #Public Pages
  match '/feedback', :to => 'staticpages#feedback'
  match '/about', :to => 'staticpages#about'
  match'/internships', to: 'staticpages#internships'
  match'/graduate_jobs', to: 'staticpages#graduate_jobs'
  match'/invite', to: 'staticpages#invite'
  
  match '/invitable', to: 'staticpages#invitable'

  match '/updates', to: 'staticpages#updates'
  #api (test)
  #match '/api', to: 'staticpages#api'
  resources :api

  #match '/create_comment', to: 'comments#create_comment'
  
  #User's Signed In Pages
  #match '/resumeQuestions', :to => 'dashboards#resumeQuestions'
  #match '/resume', :to => 'dashboards#resume'
  match '/changeSettings', :to => 'dashboards#changeSettings'
  match '/quicklist', :to => 'dashboards#add_quick_follow_list', via: [:post]
  match '/upvoted_comments', :to => 'dashboards#upvoted_comments'
  
  #admin pages
  match '/admin', to: 'dashboards#admin'
  
  #knowledge base
  match '/knowledgebase', to: 'articles#index'
  
  #suggestions & bugs
  match '/suggestions', to: 'problems#new'
  
  match '/invite', to: 'groups#invite'
  
  #dashboards
  match'/my_jobs', to: 'dashboards#my_jobs'


  
  #Resources
  #resources :schools, except: [:show] 
  resources :settings, except: [:index, :new, :edit]
  resources :questions, except: [:new]
  resources :companies
  resources :jobs, except: [:new]
  resources :boards, except: [:new]
  resources :posts, except: [:new]
  resources :app_lists, except: [:new]
  resources :notes, only: [:create, :update, :destroy]

  resources :searches  
  resources :categories
  resources :roles
  resources :industries
  resources :answers, only: [:create, :update, :destroy]
  
  resources :follows, only: [:create, :destroy]
  
  #social _feature_
  resources :groups do 
    resources :documents
  end
  
  
  resources :groupmembers, only: [:create, :destroy]
  resources :comments, :only => [:create, :destroy, :index, :new]
  
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
  
  #resources :employments do
  #  resources :bullets
  #  resources :responses
  #end

  #resources :extracurriculars do
  #  resources :bullets
  #  resources :responses
  #end
  
  #Devise gem for users and their accounts
  devise_for :users, :controllers => {registrations: 'registrations'}

  #error pages
  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/} # via: :all

  resources :comments do
    get :autocomplete_company_name, :on => :collection
  end

end


