class Council < ApplicationRecord
  belongs_to :school
  has_many :attendances
  has_many :reports
  
  validates :title, presence: true
  validates :date, presence: true
  
  # Supprimer les validations et méthodes liées à status
end