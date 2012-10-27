TodoApp::Application.routes.draw do

	devise_for :users

	resources :todos do
		member do
			post :mark_completed
		end
	end

	root :to => 'todos#index'
end
