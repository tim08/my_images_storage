class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :albums
  has_many :images

  before_create :generate_api_token!

  def generate_api_token!
    self.api_token = Devise.friendly_token(40)
  end
end
