require 'rails_helper'

RSpec.describe Api::UrlMapsController, :type => :controller do

	describe '#create' do
		context 'with valid url' do
			before { post :create, {:format => 'json', :url_map => {:origin_url => 'www.valid_url.com'}} }
			it 'creates obj and returns json with shortened url' do
				expect(UrlMap.count).to be(1)
				res = JSON.parse(response.body)
				expect(res['errors']).to be_blank
				expect(res['shortened_url']).to_not be_empty
			end
		end

		context 'with invalid url' do
			before { post :create, {:format => 'json', :url_map => {:origin_url => 'fake_url'}} }
			it 'does not create obj and returns errors hash' do
				expect(UrlMap.count).to be(0)
				res = JSON.parse(response.body)
				expect(res['errors']).to_not be_empty
			end
		end
	end

end
