RSpec.describe ApplicationCable::Connection, type: :channel do
  let(:user) { create(:user) }
  it 'is expected to connect successfully with valid user' do
    connect "/cable?uid=#{user.email}"
    expect(connection.current_user).to eq user
  end

  it 'is expected to reject connection without valid user' do
    expect { connect '/cable' }.to have_rejected_connection
  end
end