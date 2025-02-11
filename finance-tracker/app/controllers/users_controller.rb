class UsersController < ApplicationController
	def my_portfolio
		@user = current_user
		@user_stocks = current_user.stocks
	end

	def show
		@user = User.find(params[:id])
		@user_stocks = @user.stocks
	end


	def my_friends
		@friendships = current_user.friends
	end

	def search
		if params[:search_param].blank?
			flash[:danger] = "You have entered an empty search string"
		else
			@users = User.search(params[:search_param])
			@users = current_user.except_current_user(@users)
			flash[:danger] = "No users match this search criteria" if @users.blank?
		end
		@friendships = current_user.friends
		render 'users/my_friends' 
	end

	def add_friend
		@friend = User.find(params[:friend])
		current_user.friendships.build(friend_id: @friend.id)
		if current_user.save
			flash[:success] = 'Friend added'
		else
			flash[:danger] = 'Error in adding friend'
		end
		redirect_to my_friends_path
	end

	def destroy_friend

	end
end
