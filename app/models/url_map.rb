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

class UrlMap < ActiveRecord::Base
	include Tokenable
	include Urlable

	alias_attribute :url, :origin_url
	validates :url, presence: true, url: true
	
end
