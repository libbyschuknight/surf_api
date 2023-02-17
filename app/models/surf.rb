class Surf < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :board
end
