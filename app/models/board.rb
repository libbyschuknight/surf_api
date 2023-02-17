class Board < ApplicationRecord
  belongs_to :user
  has_many :surfs
end
