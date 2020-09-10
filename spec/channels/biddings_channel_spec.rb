
RSpec.describe BiddingsChannel, type: :channel do
  let!(:bid) { create(:bidding ) }
  let(:sender) { bid.listing.landlord}

  describe 'subscription' do
    before do
      # stub_connection user_id: user.id
      subscribe(room: {bidding_id: bid.id})
    end

    it {
      expect(subscription).to be_confirmed
    }

    it {
      expect(subscription).to have_stream_from("biddings_channel_#{bid.id}")
    }

    it 'is expected to broadcast to "biddings_channel_:bidding_id"' do
      expect do
        ActionCable.server.broadcast(
          "biddings_channel_#{bid.id}",
          data: {
            message: {
              body: 'incoming message',
              sender_id: sender.id
            }
          }
        )
      end
        .to have_broadcasted_to("biddings_channel_#{bid.id}")
        .with(data: { message: {body: 'incoming message', sender_id: sender.id} })
    end
  end
end
