Resumereader::Application.routes.draw do

  get "errors/404"

  get "errors/500"

  get "errors/422"

  get "resumes/new"

  #Root to public home page unless signed in
  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'
  
  #Public Pages
  match '/feedback', :to => 'staticpages#feedback'
  match '/about', :to => 'staticpages#about'
  
  #User's Signed In Pages
  match '/resumeQuestions', :to => 'dashboards#resumeQuestions'
  match '/resume', :to => 'dashboards#resume'
  match '/changeSettings', :to => 'dashboards#changeSettings'
  
  #Resources
  resources :schools, except: [:show] 
  resources :problems, only: [:create, :index]
  resources :settings, except: [:index, :new, :edit]
  resources :questions
  resources :companies
  resources :jobs, except: [:new]
  resources :boards, except: [:new]
  resources :posts, except: [:new]
  resources :app_lists, except: [:new]
  
  resources :questions
  
  resources :employments do
    resources :bullets
    resources :responses
  end

  resources :extracurriculars do
    resources :bullets
    resources :responses
  end
  
  #Devise gem for users and their accounts
  devise_for :users

  #error pages
  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/} # via: :all


end


