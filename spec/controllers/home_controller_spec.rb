require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

	describe '#index' do
		subject { get :index }
		it 'renders index template' do
			expect(subject).to render_template(:index)
		end
	end

	describe '#show' do
		context 'with invalid token' do
			subject { get :show, :token => 'notoken' }
			it 'redirects to home page' do
				expect(subject).to redirect_to(root_path)
			end
		end
		context 'with valid token' do
			before { @url_map = create(:url_map) }
			subject { get :show, :token => @url_map.token }
			it 'redirects to origin_url' do
				expect(subject).to redirect_to(@url_map.origin_url)
			end
		end
	end

end
