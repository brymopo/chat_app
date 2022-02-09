class Message < ApplicationRecord
  belongs_to :room
  validates :author, :content, presence: true
  broadcasts_to ->(_){ "room_messages" }, inserts_by: :append, target: "room_messages"

  def edited?
    created_at != updated_at
  end
end
