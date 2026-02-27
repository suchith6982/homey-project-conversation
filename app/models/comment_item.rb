class CommentItem < ConversationItem
  validates :body, presence: true
end
