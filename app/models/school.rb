class School < ApplicationRecord
  has_one :school_official_association, class_name: 'Association'  # Changé le nom
  has_many :councils
  has_many :information
  
  validates :name, presence: true
  validates :address, presence: true
end