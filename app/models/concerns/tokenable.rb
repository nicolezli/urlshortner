module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token(len=5)
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(len, false)
      break random_token unless self.class.exists?(token: random_token)
    end
  end
end