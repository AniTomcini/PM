class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :devices, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :videos, dependent: :destroy
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { in: 3..25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "username", "email", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["devices", "playlists", "videos"]
  end

end
