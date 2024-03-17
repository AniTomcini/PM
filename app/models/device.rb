class Device < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  validates :name, presence: true, length: {minimum: 6, maximum: 100}
end
