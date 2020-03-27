class User < ApplicationRecord
  has_many :things
  has_many :upvotes

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create
    user.update(
      name: auth_hash.info.name,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token
    )
    user
  end

  def already_upvoted?(thing)
    User.joins(:upvotes).where(:upvotes => {:thing_id => thing.id}).size > 0
  end
end
