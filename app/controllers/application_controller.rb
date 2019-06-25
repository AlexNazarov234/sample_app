class ApplicationController < ActionController::Base
	def hello
		render plain: 'Hi world!'
	end
end
