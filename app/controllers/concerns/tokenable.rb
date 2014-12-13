module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    self.key = loop do
      random_token = (0...5).map { o[rand(o.length)] }.join
      break random_token unless Trip.exists?(key: random_token)
    end
  end
end
