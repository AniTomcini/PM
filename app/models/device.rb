class Device < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  validates :name, presence: true, length: {minimum: 6, maximum: 100}

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["playlist", "user"]
  end

end
