class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :budgets, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :places, dependent: :destroy
  mount_uploader :image, ImageUploader, :dependent => :destroy

  after_initialize :init
  def init
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...50).map { o[rand(o.length)] }.join

    self.title ||= "Trip"
    self.description ||= "<p>Type a nice description...</p>"
    self.visibility ||= "private"
    self.key ||= string
  end
end
