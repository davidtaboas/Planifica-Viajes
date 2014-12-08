class Trip < ActiveRecord::Base
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

    self.title ||= "Trip"
    self.description ||= "<p>Type a nice description...</p>"
    self.visibility ||= "private"
    self.key ||= string
  end

  def author_by_name
    require "awesome_print"
    user = User.find(self.user_id)
    return user.username
  end
end
