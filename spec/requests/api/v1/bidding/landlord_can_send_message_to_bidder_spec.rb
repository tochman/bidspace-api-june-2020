RSpec.describe '', type: :request do
  let!(:landlord) { create(:user)}
  let!(:landlord_credentials) { landlord.create_new_auth_token }
  let!(:landlord_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(landlord_credentials) }
  let!(:bidder) { create(:user)}

  let!(:listing) { create(:listing, landlord_id: landlord.id) }
  let!(:bid) { create(:bidding, listing_id: listing.id, user_id: bidder.id)}

  before do
    post "/api/v1/biddings/#{bid.id}/messages",
           params: {
             message: {
               body: "This sounds interesting....",
             }
           }, headers: landlord_headers

  end

  it 'is expected to respond with 201' do
    expect(response.status).to eq 201
  end
end