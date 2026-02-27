class ConversationItem < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # Default ordering for timeline
  scope :recent_first, -> { order(created_at: :desc) }
end
