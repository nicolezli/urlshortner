# == Schema Information
#
# Table name: url_maps
#
#  id         :integer          not null, primary key
#  origin_url :string(255)      not null
#  token      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe UrlMap, :type => :model do

	it 'has a valid factory' do
		expect(build(:url_map)).to be_valid
	end

	it 'does not allow empty url' do
		url_map = build(:url_map, {:origin_url => ''})
		expect(url_map).to_not be_valid
	end

	it 'does not allow invalid url' do
		url_map = build(:url_map, {:origin_url => 'one_word'})
		expect(url_map).to_not be_valid
	end

	it 'allows valid url' do
		url_map = build(:url_map, {:origin_url => 'hostname.com'})
		expect(url_map).to be_valid

		url_map = build(:url_map, {:origin_url => 'http://hostname.com'})
		expect(url_map).to be_valid

		url_map = build(:url_map, {:origin_url => 'https://hostname.com'})
		expect(url_map).to be_valid
	end

	it 'always generate uniq token' do
		url_map1 = create(:url_map, {:origin_url => 'http://hostname.com', :token => 'exampletoken'})
		expect(url_map1).to be_valid

		url_map2 = create(:url_map, {:origin_url => 'http://hostname.com', :token => 'exampletoken'})
		expect(url_map2).to be_valid

		expect(url_map1.token).to_not equal(url_map2.token)
	end

end
