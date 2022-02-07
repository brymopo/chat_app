class Room < ApplicationRecord
  broadcasts_to ->(_){ "rooms" }, inserts_by: :append, target: "rooms"
  validates :name, presence: true
end
