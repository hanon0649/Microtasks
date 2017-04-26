class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :microtasks
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  #===add_start===
  
  # has_many :favorelationships
  
  ##===add_start===
  
  has_many :favoritings, through: :favorites, source: :microtask
  
  
  ###===add_start===
  
  has_many :favorites
  
  ###===add_end===
  ##===add_end===
  #===add_end===

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def feed_microtasks
    Microtask.where(user_id: self.following_ids + [self.id])
  end
  
  #===add_start===
  
  def favorite(microtask)
    # unless self == ???
      self.favorites.find_or_create_by(microtask_id: microtask.id)
    # end
  end

  def unfavorite(microtask)
    favorite = self.favorites.find_by(microtask_id: microtask.id)
    favorite.destroy if favorite
  end
  
  def favoriting?(microtask)
    self.favoritings.include?(microtask)
  end
  
  def feed_favorites
    Microtask.where(user_id: self.favoriting_ids)
  end
  
  #===add_end===

end