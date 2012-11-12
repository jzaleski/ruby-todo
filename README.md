todo
====

A very simple To-do application w/ authentication

Configuration:

- git clone https://github.com/jzaleski/todo.git
- if you are using RVM: rvm gemset create todo
- cd ..
- cd -
- gem install bundler
- bundle install
- cp config/database.yml{.example,}
- modify config/database.yml to match your local data-store settings (example file is for configured for "PostgreSQL")
- rake db:create
- rake db:migrate
- rake db:test:clone
- rake test
- rails server
- browse to http://localhost:3000 -- if you see a login page you're good to go

Stay tuned for future updates!
