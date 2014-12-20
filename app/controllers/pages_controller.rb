class PagesController < ApplicationController
  def features
    set_meta_tags :title => t("seo.features")
  end

  def help
    set_meta_tags :title => t("seo.help")
  end

  def contact
    set_meta_tags :title => t("seo.contact")
  end
end
