class Performer < ActiveRecord::Base
  def position=(p)
    RedisCache.redis.set("#{self.id}.position", p)
  end
  def position()
    return RedisCache.redis.get("#{self.id}.position")
  end
end
