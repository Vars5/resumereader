Resumereader::Application.routes.draw do

  get "questions/new"

  get "responses/index"

  get "responses/new"

  root :to => 'staticpages#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'
  
  match '/feedback', :to => 'staticpages#feedback'
  match '/resumeQuestions', :to => 'staticpages#resumeQuestions'
  match '/about', :to => 'staticpages#about'

  resources :schools 
  
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
