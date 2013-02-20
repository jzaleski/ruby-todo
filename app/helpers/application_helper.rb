module ApplicationHelper

	def controller_stylesheet_link_tag
		# e.g. todos_controller => assets/stylesheets/todos.css
		stylesheet = "#{params[:controller]}.css"
		# if stylesheet asset exists include it
		stylesheet_link_tag stylesheet if Rails.application.assets.find_asset(stylesheet)
	end


	def controller_javascript_include_tag
		# e.g. todos_controller => assets/javascripts/todos.js
		javascript = "#{params[:controller]}.js"
		# if javascript asset exists include it
		javascript_include_tag javascript if Rails.application.assets.find_asset(javascript)
	end

end
