class Message < ApplicationRecord
  belongs_to :room
  validates :author, :content, presence: true
  broadcasts_to ->(message){ message.room }, inserts_by: "append", target: "messages"

  def edited?
    created_at != updated_at
  end
end
