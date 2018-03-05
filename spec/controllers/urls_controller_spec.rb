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

  describe '#redirect_to_original' do
    before do
      headers = { "Content-Type" => "application/json" }
      request.headers.merge! headers
      post 'short_url', {params: {url: original_url}, format: :json}
      parsed_json = JSON.parse(response.body)
      short_url_without_http = parsed_json['short_url'].split('/')[-1]
      get 'redirect_to_original', {params: {short_url: short_url_without_http}, format: :json}
    end

    let(:original_url) { 'http://www.looongurl.com' }

    context 'GET request to short url to redirect to original url' do
      it 'returns status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to original url' do
        expect(response.body).to include original_url
        expect(response.body).to include 'redirected'
      end
    end
  end
end
