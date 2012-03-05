class UsersController < ApplicationController
	before_filter :authenticate, 	:only => [:edit, :update, :index]
	before_filter :correct_user, 	:only => [:edit, :update]
	before_filter :admin_user, 		:only => :destroy
	
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed"
		redirect_to users_path
	end
	
	def new
		@title = "Sign up"
		@user = User.new
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to @user
		else
			@title = "Sign up again"
			render 'new'
		end
	end
	
	def index
		@title = "All users"
		@users = User.all
	end
	
	
	def show
		@user = User.find(params[:id])
		@title = @user.name
		@posts = @user.posts
	end
	
	def edit
		@title = "Edit User"
	end	
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user
		else
			@title = "Edit user"
			render 'edit'
		end
	end
	
	private
		def authenticate
			deny_access unless signed_in?
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end
		
		def admin_user
			redirect_to(root_path) unless current_user.admin?
		end
end
