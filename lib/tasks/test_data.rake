# frozen_string_literal: true

namespace :test_data do
  task :create_list, [:user_id, :list_name] => :environment do |_, args|
    user_id = args[:user_id]
    list_name = args[:list_name]
    abort %(Must provide a "user_id" and "list_name") \
      unless [user_id, list_name].all?
    user = User.find_by(id: user_id)
    abort %(Could not find a "User" with id: "#{user_id}") unless user
    list = List.find_by(name: list_name)
    abort %(List with name: #{list_name} already exists) if list
    list = List.new(name: list_name, created_by_user: user)
    list.users << user
    list.save!
    puts %(Created "Lists" with id: "#{list.id}")
  end

  task :destroy_list, [:list_id_or_name] => :environment do |_, args|
    list_id_or_name = args[:list_id_or_name]
    abort %(Must provide a "list_id" or "list_name") unless list_id_or_name
    if list_id_or_name =~ /\A[1-9][0-9]*\Z/
      list = List.find_by(id: list_id_or_name)
    else
      List.find_by(name: list_id_or_name)
    end
    abort %(Could not find a "List" with id (or name): "#{list_id_or_name}") \
      unless list
    abort %(Cannot destroy default "List" for "User") if list.is_default?
    list.destroy
  end
end
