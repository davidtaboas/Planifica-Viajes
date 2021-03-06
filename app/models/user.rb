class User < ActiveRecord::Base
  # Utilización de roles para administrar viajes
  rolify

  # Uso como parte activa para hacer favoritos
  acts_as_marker


  has_many :trips, :dependent => :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,:validatable
  validates_uniqueness_of :username
  attr_accessor :login

  def email_required?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  validates :username,
    :uniqueness => {
      :case_sensitive => false
    }

end
