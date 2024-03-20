class Playlist < ApplicationRecord
  belongs_to :user
  has_one :device
  has_many :videos
  has_one_attached :media_file, dependent: :destroy
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "title", "description", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

end
