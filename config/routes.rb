TodoApp::Application.routes.draw do
	resources :todos, :except => [:destroy, :edit, :new, :show]
	root :to => 'todos#index'
end
