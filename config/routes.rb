Rails.application.routes.draw do
	root 'projects#index'
  resources :users
  resources :projects
  resources :sessions do
  	collection do
  		get 'login'
  		delete 'logout'
  		post 'new_session'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
