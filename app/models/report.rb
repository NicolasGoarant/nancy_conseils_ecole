class Report < ApplicationRecord
  belongs_to :council
  belongs_to :user
  
  validates :summary, presence: true
  validates :submitted, inclusion: { in: [true, false] }
end