class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validate :validate_username

  attr_accessor :login
  

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def validate_username
    if Usuario.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  enum usuario_tipo: [
    :comum,
    :pode_incluir,
    :admin
  ]

  def administrador?
    admin == 2 ? true : false
  end

  def pode_incluir?
    admin == 1 || admin == 2 ? true : false
  end

end
