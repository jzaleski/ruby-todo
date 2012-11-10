TodoApp::Application.routes.draw do

	devise_for :users

	resources :todos, :except => [:edit, :new, :show]

	root :to => 'todos#index'
end
