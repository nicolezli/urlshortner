# == Schema Information
#
# Table name: url_maps
#
#  id         :integer          not null, primary key
#  origin_url :string(2083)     not null
#  token      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe UrlMap, :type => :model do

	it 'has a valid factory' do
		expect(build(:url_map)).to be_valid
	end

	context 'url validation' do
		it 'must not be empty' do
			url_map = build(:url_map, {:origin_url => ''})
			expect(url_map).to_not be_valid
		end
		it 'must have top level domain and domain' do
			url_map = build(:url_map, {:origin_url => 'domain'})
			expect(url_map).to_not be_valid

			url_map = build(:url_map, {:origin_url => 'domain.top'})
			expect(url_map).to be_valid
		end
		it 'does not allow top level domain with less than 2 chars' do
			url_map = build(:url_map, {:origin_url => 'domain.t'})
			expect(url_map).to_not be_valid
		end
		it 'allows long url of size 2048' do
			url_map = build(:url_map, {:origin_url => "domain1.#{'x'*2040}"})
			expect(url_map).to be_valid
		end
		it 'allows ip address as hostname' do
			url_map = build(:url_map, {:origin_url => '192.168.1.1'})
			expect(url_map).to be_valid
		end
		it 'allows hostname with port' do
			url_map = build(:url_map, {:origin_url => 'domain.top:3000'})
			expect(url_map).to be_valid
		end
		it 'allows subdomains' do
			url_map = build(:url_map, {:origin_url => 'sub.domain.top'})
			expect(url_map).to be_valid
		end
		it 'allows directory' do
			url_map = build(:url_map, {:origin_url => 'domain.top/dir'})
			expect(url_map).to be_valid
		end
		it 'allows query string' do
			url_map = build(:url_map, {:origin_url => 'domain.top?key1=val1'})
			expect(url_map).to be_valid
		end
		it 'allows hash identifier' do
			url_map = build(:url_map, {:origin_url => 'domain.top/#id'})
			expect(url_map).to be_valid
		end
		it 'allows subdomain + domain + dir +  query string + hash id' do
			url_map = build(:url_map, {:origin_url => 'sub.domain.top/dir/?key1=val1#id'})
			expect(url_map).to be_valid
		end
	end

	it 'always generate uniq token' do
		url_map1 = create(:url_map, {:origin_url => 'http://hostname.com', :token => 'exampletoken'})
		expect(url_map1).to be_valid

		url_map2 = create(:url_map, {:origin_url => 'http://hostname.com', :token => 'exampletoken'})
		expect(url_map2).to be_valid

		expect(url_map1.token).to_not equal(url_map2.token)
	end

end
