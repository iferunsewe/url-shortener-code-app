class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def short_url
    @url = Url.new(original: params[:url], shortened: "http://#{Url.generate_random_alpha_numeric_string}")
    @url.save
    respond_to do |format|
      format.json
      format.js { }
      format.html
    end
  end
end
