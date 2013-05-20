Resumereader::Application.routes.draw do

  get "responses/index"

  get "responses/new"

  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'
  
  match '/feedback', :to => 'staticpages#feedback'
  match '/resumeQuestions', :to => 'dashboards#resumeQuestions'
  match '/about', :to => 'staticpages#about'
  match '/resume', :to => 'dashboards#resume'
  match '/changeSettings', :to => 'dashboards#changeSettings'
  
  resources :schools 
  resources :problems, only: [:new, :create, :index]
  resources :settings, except: [:index]
  
  resources :employments do
    resources :bullets
    resources :responses
  end

  resources :extracurriculars do
    resources :bullets
    resources :responses
  end
  
  devise_for :users
end
