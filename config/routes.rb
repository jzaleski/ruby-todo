TodoApp::Application.routes.draw do

	devise_for :users

	match '/todos/edit_in_place', :via => [:get, :post, :put]

	resources :todos do
		member do
			post :mark_completed
		end
	end

	root :to => 'todos#index'
end
