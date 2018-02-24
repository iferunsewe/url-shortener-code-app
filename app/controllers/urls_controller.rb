class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def short_url
    @url = Url.new(original: params[:url], shortened: "http://#{generate_random_alpha_numeric_string}")
    @url.save
    respond_to do |format|
      format.json
      format.js { }
      format.html
    end
  end

  private

  def generate_random_alpha_numeric_string
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    (0..1).map{ range.sample }.join
  end
end
