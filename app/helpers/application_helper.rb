module ApplicationHelper
  def share_url(service,web)

      # Generates an url that will 'share with Facebook', and can includes title, url, summary, images without need of OG data.
      #
      # URL generate will be like
      # http://www.facebook.com/sharer.php?s=100&p[title]=We also do cookies&p[url]=http://www.wealsodocookies.com&p[images][0]=http://www.wealsodocookies.com/images/logo.jpg&p[summary]=Super developer company
      #
      # For this you'll need to pass the options as
      #
      # { :url     => "http://www.wealsodocookies.com",
      #   :title   => "We also do cookies",
      #   :images  => {0 => "http://imagelink"} # You can have multiple images here
      #   :summary => "My summary here"
      # }

      if service == "facebook"
        url = "https://www.facebook.com/sharer/sharer.php?u=#{web}"
      elsif service == "twitter"
        url = "https://twitter.com/intent/tweet?url=#{web}"
      end

  end
end
