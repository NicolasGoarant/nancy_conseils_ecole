class Attendance < ApplicationRecord
  belongs_to :council
  belongs_to :user
  
  validates :status, presence: true
  
  # Remplacer enum status: { ... } par cette approche
  validates :status, inclusion: { in: %w(pending attending not_attending) }
  
  # Ajouter ces méthodes d'aide
  def pending?
    status == 'pending'
  end
  
  def attending?
    status == 'attending'
  end
  
  def not_attending?
    status == 'not_attending'
  end
end