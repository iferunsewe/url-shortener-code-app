require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe '#short_url' do
    before do
      headers = { "CONTENT_TYPE" => "application/json" }
      request.headers.merge! headers
      post 'short_url', params: {url: 'http://www.looongurl.com'}
    end

    context 'POST request to /short_url' do
      it 'returns a shortened url' do

      end

      it 'returns the original url' do

      end

      it 'returns status code 200' do

      end
    end
  end

end
