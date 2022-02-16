module ApplicationHelper
  def is_current_user?(user:, current:)
    return false unless user.present? && current.present?

    current == user
  end
end
