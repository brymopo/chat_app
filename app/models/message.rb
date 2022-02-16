class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :content, presence: true
  broadcasts_to ->(message){ message.room }, inserts_by: "append", target: "messages"
# after_create_commit ->(message){ broadcast_action_later_to message.room, partial: "rooms/room-detail", action: "append", target: "messages", locals: { user: Current.user } }
# after_update_commit ->(message){ broadcast_replace_later_to message.room, target: self, locals: { user: Current.user } }
# after_destroy_commit ->(message){ broadcast_remove_to message.room }

  def edited?
    created_at != updated_at
  end
end
