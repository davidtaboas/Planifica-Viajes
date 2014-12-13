class ErrorsController < ApplicationController


  def file_not_found

    set_meta_tags :title =>  "404"
  end

  def internal_server_error

    set_meta_tags :title =>  "500"
  end
end
