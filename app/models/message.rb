class Message < ApplicationRecord
  belongs_to :room
  validates :author, :content, presence: true
  broadcasts

  def edited?
    created_at != updated_at
  end
end
