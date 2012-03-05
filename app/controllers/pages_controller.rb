class PagesController < ApplicationController
	def welcome
		@title="Welcome"

	end
	
	def help
		@title="Help"
	end
	
	def users
		@title="Users"
	end
	
	def submit
		if signed_in?
			@post = Post.new
		end
		@title="New Post"
	end

end
