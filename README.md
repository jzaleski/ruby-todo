todo
====

Configuration:

- git clone https://github.com/jzaleski/todo.git
- if you are using RVM: rvm gemset create todo
- cd ..
- cd -
- bundle install
- cp config/database.yml{.example,}
- modify config/database.yml to match your local data-store settings (example file is for configured for "PostgreSQL")
- rake db:create
- rake db:migrate
- rake db:test:clone
- rake test
- rails server
- browse to http://localhost:3000 -- if you see a notepad you're good to go

Stay tuned for future updates!
