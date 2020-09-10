
RSpec.describe Message, type: :model do
  let!(:bidding) { create(:bidding ) }

  describe 'broadcast' do
    it 'should broadcast after creation' do
      expect {
        create(:message, bidding: bidding)
      }.to have_broadcasted_to("biddings_channel_#{bidding.id}")
    end
  end
end
