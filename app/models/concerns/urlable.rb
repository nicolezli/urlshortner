module Urlable
  extend ActiveSupport::Concern

  included do
    before_validation :normalize_url
  end

  protected

  def normalize_url
    return if self.url.blank?
    urld = self.url.downcase
    self.url = (urld.starts_with?('http://')||urld.starts_with?('https://')) ? url : "http://#{url}"
  end
end