class UrlValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value =~ /^(https?:\/\/)((?!-)[A-Za-z0-9-]{1,63}(?<!-)\.)+([A-Za-z]{2,6})(\S*)$/
			record.errors[attribute] << (options[:message] || "is not a valid url")
		end
	end
end