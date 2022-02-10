class Message < ApplicationRecord
  belongs_to :room
  after_create_commit { broadcast_append_to(room, inserts_by: "append", target: "room_#{room_id}_messages") }
  validates :author, :content, presence: true
  broadcasts

  def edited?
    created_at != updated_at
  end
end
