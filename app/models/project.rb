class Project < ApplicationRecord
  has_many :conversation_items, dependent: :destroy

  STATUSES = %w[new in_progress blocked done].freeze

  validates :name, presence: true
  validates :status, inclusion: { in: STATUSES }, allow_nil: true
end
