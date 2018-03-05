class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def short_url
    create_url unless request.format.html?
    respond_to do |format|
      format.json
      format.js { }
      format.html
    end
  end

  def redirect_to_original
    @url = find_original_url
    redirect_to @url.original
  end

  private

  def create_url
    @url = Url.create(original: params[:url], shortened: "http://#{Url.generate_random_alpha_numeric_string(6)}")
  end

  def find_original_url
    Url.find_by(shortened: "http://#{params[:short_url]}")
  end
end
