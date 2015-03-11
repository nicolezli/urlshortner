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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :url_map do
    origin_url "http://www.example.com"
    token "something"
  end
end
