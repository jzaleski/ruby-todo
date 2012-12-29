TodoApp::Application.routes.draw do
	resources :todos, :except => [:edit, :new, :show]
	root :to => 'todos#index'
end
