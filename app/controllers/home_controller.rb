class HomeController < ApplicationController

	# Home page
	def index
	end

	# Url redirect
	def show
		if @url_map = UrlMap.find_by_token(token)
			redirect_to @url_map.origin_url
		else
			redirect_to root_path
		end
	end

	protected

	def token
		params[:token]
	end

end
