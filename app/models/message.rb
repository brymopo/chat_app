class Message < ApplicationRecord
  belongs_to :room
  validates :author, :content, presence: true
end
