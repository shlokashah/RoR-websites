class StocksController < ApplicationController
	def search
		@user = current_user
		@user_stocks = current_user.stocks
		if params[:stock].present?
			@stock = Stock.new_from_lookup(params[:stock])
			if @stock
				render 'users/my_portfolio'
			else
				flash[:danger] = "Incorrect symbol"
				redirect_to my_portfolio_path
			end
		else
			flash[:danger] = "Empty search string"
			redirect_to my_portfolio_path
		end
	end

end