# url_map

json.origin_url url_map.origin_url
json.token url_map.token
json.shortened_url url_map.token.present? ? shortner_url(url_map.token) : nil

json.errors(url_map.errors) unless url_map.errors.blank?