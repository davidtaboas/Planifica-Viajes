class PagesController < ApplicationController
  def features
  end

  def help
    set_meta_tags :title => "¿Te ayudamos?"
  end

  def contact
    set_meta_tags :title => "Contactar"
  end
end
