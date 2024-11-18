class Game < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :winnerID, presence: true
end
