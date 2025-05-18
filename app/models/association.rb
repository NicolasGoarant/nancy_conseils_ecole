class Association < ApplicationRecord
  belongs_to :school
  belongs_to :user
  
  validates :active, inclusion: { in: [true, false] }
  
  scope :active, -> { where(active: true) }
end