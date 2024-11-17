class Game < ApplicationRecord
  validates :playerID, presence: true
  validates :winnerID, presence: true
end
