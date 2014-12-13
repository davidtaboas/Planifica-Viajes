class Trip < ActiveRecord::Base
  # Administración de roles
  resourcify

  # Gestión de favoritos
  markable_as :favorite

  belongs_to :user
  has_many :budgets, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :places, dependent: :destroy
  mount_uploader :image, ImageUploader, :dependent => :destroy

  after_initialize :init
  def init
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...5).map { o[rand(o.length)] }.join
    #comprobar que key no existe

    self.title ||= I18n.t("trip.tempTitle")
    self.description ||= I18n.t("trip.tempDescription")
    self.visibility ||= "private"
    self.key ||= string
    self.user.add_role :admin, self
  end

  def author_by_name
    user = User.find(self.user_id)
    return user.username
  end
end
