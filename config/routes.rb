Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  
  root 'home#index'
  scope '/dashboard' do
    get '/', to: 'dashboard#index', :as => :dashboard
  end

  resources :dreams do
    resources :sequences
  end
  resources :characters
  resources :places

end
