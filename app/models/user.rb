class User < ApplicationRecord
  has_many :surfs
  has_many :boards
  has_many :locations, through: :surfs # ??
end
