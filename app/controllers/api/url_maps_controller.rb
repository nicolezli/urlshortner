class Api::UrlMapsController < ApiController

	def create
		@url_map = UrlMap.create(url_map_params)
		render :show
	end

	protected

	def url_map_params
		params.require(:url_map).permit(:origin_url)
	end

end
