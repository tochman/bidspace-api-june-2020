# frozen_string_literal: true

RSpec.describe 'POST /api/v1/biddings/:bidding_id/messages', type: :request do
  let!(:landlord_headers) do
    @landlord = create(:user)
    { HTTP_ACCEPT: 'application/json' }.merge!(@landlord.create_new_auth_token)
  end
  let!(:listing) { create(:listing, landlord: @landlord) }
  let!(:bid) { create(:bidding, listing: listing, user: create(:user) ) }

  before do
    ActionCable.server.restart
    post "/api/v1/biddings/#{bid.id}/messages",
         params: {
           message: {
             body: 'This sounds interesting....'
           }
         }, headers: landlord_headers
  end

  it 'is expected to respond with 201' do
    expect(response.status).to eq 201
  end

  it "is expected to dispatch a AC message to 'biddings_channel_:bidding_id'" do
    expect(
      JSON.parse(
        channels["biddings_channel_#{bid.id}"].first
      )['message']['body']
    ).to eq 'This sounds interesting....'
  end
end
