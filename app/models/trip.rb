class Trip < ActiveRecord::Base
  include Tokenable

  # Administración de roles
  resourcify

  # Gestión de favoritos
  markable_as :favorite

  before_create :generate_token

  belongs_to :user
  has_many :budgets, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :places, dependent: :destroy
  mount_uploader :image, ImageUploader, :dependent => :destroy

  after_initialize :init
  def init


    self.title ||= I18n.t("trip.tempTitle")
    self.description ||= I18n.t("trip.tempDescription")
    self.visibility ||= "private"
    self.user.add_role :admin, self
  end

  def author_by_name
    user = User.find(self.user_id)
    return user.username
  end





end
