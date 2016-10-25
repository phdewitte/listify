require 'rails_helper'
require 'HTTParty'
require 'net/http'

RSpec.describe SpotifyCaller, type: :helper do
  # Test for ENV variables?
  describe '#encoded_client' do
    it 'creates a string from client credentials' do
    allow(SpotifyCaller).to receive(:client_id) { 'hi' }
    allow(SpotifyCaller).to receive(:client_secret) { 'bye' }
    expect(SpotifyCaller.encoded_client).to be_a String
    end

    it 'is a Base64 encoded string' do
      allow(SpotifyCaller).to receive(:client_id) { 'hi' }
      allow(SpotifyCaller).to receive(:client_secret) { 'bye' }
      code = SpotifyCaller.encoded_client
      expect(Base64.decode64(code)).to eq 'hi:bye'
    end
  end

  # Explore webmock for stubs
  describe '#spotify_authorize' do
    it 'makes a successful call to the Spotify API' do
      expect(SpotifyCaller.spotify_authorize).to be_success
    end

    it 'receives an HTTParty reponse' do
      expect(SpotifyCaller.spotify_authorize).to be_an HTTParty::Response
    end

    it 'responds to the auth call with a 200 OK' do
      expect(SpotifyCaller.spotify_authorize.response).to be_a NET::HTTPOK
    end

    it 'grants an authorization token' do
      expect(SpotifyCaller.spotify_authorize.parsed_response['access_token']).to be_a String
    end

    it 'grants an authorization bearer type' do
      expect(SpotifyCaller.spotify_authorize.parsed_response['token_type']).to eq 'Bearer'
    end
  end


end