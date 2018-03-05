require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  render_views

  describe '#short_url' do
    before do
      headers = { "Content-Type" => "application/json" }
      request.headers.merge! headers
      post 'short_url', {params: {url: original_url}, format: :json}
    end

    let(:parsed_json){  JSON.parse(response.body) }
    let(:original_url) { 'http://www.looongurl.com' }

    context 'POST request to /short_url' do
      it 'returns a shortened url' do
        expect(parsed_json['short_url']).to match(/https?:\/\/[\S]+/)
      end

      it 'returns the original url' do
        expect(parsed_json['url']).to eq original_url
      end

      it 'renders a template' do
        expect(response).to render_template(:short_url)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
