class Chirp < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true, length: { maximum: 160 }
end
