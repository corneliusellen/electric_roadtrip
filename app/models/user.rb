class User < ApplicationRecord
  has_many :favorites
  has_many :vehicles, through: :favorites

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
    provider: auth[:provider],
    uid: auth[:uid],
    email: auth[:info][:email],
    first_name: auth[:info][:first_name],
    last_name: auth[:info][:last_name],
    token: auth[:credentials][:token]
  }
  user.save!
  user
  end
end
