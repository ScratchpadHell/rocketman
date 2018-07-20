class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  include HTTParty

  validates :email, presence: true

  def get_iss
    response = HTTParty.get('http://api.open-notify.org/iss-now')
    JSON.parse response.body
  end

  def get_user_loc
    response = HTTParty.get("https://api.ipgeolocation.io/ipgeo?apiKey=#{ENV['IPGEOLOCKEY']}")
    JSON.parse response.body
  end
end
