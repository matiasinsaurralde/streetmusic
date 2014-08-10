class Performer < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  attr_accessible :name, :email, :password, :password_confirmation

  def position=(p)
    RedisCache.redis.set("#{self.id}.position", p)
  end
  def position()
    return RedisCache.redis.get("#{self.id}.position")
  end
end
