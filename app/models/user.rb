class User < ApplicationRecord
  include HTTParty

  validates :name, presence: true
  validates :email, presence: true

  def get_iss
    response = HTTParty.get('http://api.open-notify.org/iss-now')
    JSON.parse response.body
  end
end
