module ApplicationHelper
  def share_url(service,id)



      if service == "facebook"
        url = "https://www.facebook.com/sharer/sharer.php?u=#{trip_url(id)}"
      elsif service == "twitter"
        url = "https://twitter.com/intent/tweet?url=#{trip_url(id)}"
      end

  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
