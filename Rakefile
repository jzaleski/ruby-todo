# Load the Rails environment (it will automatically load the `application`)
require_relative 'config/environment'

# Silence SQL logging by default, but provide an easy means through an
# environment variable to re-enable it if so desired
ActiveRecord::Base.logger = nil unless ENV['VERBOSE']

# Load the Rails application `Task(s)`
Rails.application.load_tasks
