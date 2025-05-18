class Information < ApplicationRecord
  belongs_to :school
  
  validates :title, presence: true
  validates :content, presence: true
end