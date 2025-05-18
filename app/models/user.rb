class User < ApplicationRecord
    has_secure_password
    
    has_many :associations, foreign_key: 'user_id'
    has_many :schools, through: :associations
    has_many :attendances
    has_many :reports
    
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :role, inclusion: { in: %w(admin official school) }
    
    # Méthodes d'accès pour vérifier les rôles
    def admin?
      role == 'admin'
    end
    
    def official?
      role == 'official'
    end
    
    def school?
      role == 'school'
    end
  end