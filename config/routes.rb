TodoApplication.routes.draw do
	resources :todos, :except => [:destroy, :edit, :new, :show]
	match 'login' => 'authentication#login', :via => [:get, :post]
	root :to => 'todos#index'
end
