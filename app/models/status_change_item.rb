class StatusChangeItem < ConversationItem
  validates :from_status, :to_status, presence: true
end
