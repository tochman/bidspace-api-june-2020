
RSpec.describe Message, type: :model do

  describe 'database table' do
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :sender_id }
    it { is_expected.to have_db_column :bidding_id }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :body }
  end

  describe 'relations' do
    it { is_expected.to belong_to :bidding }
    it { is_expected.to belong_to :sender }
  end

  describe 'factory' do
    it 'is expected to be valid' do
      expect(create(:message)).to be_valid
    end
  end

  describe 'broadcast' do
    let!(:bidding) { create(:bidding ) }
    it "is expected to broadcast '#{Faker::Movies::VForVendetta.quote}' after creation" do
      expect {
        create(:message, bidding: bidding)
      }.to have_broadcasted_to("biddings_channel_#{bidding.id}")
    end
  end
end
