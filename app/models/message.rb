class Message < ApplicationRecord
  belongs_to :bidding
  belongs_to :sender, class_name: 'User'
  validates_presence_of :body

  after_create :broadcast

  def broadcast
    data = { body: body, sender_id: sender.id }
    ActionCable.server.broadcast(
      "biddings_channel_#{bidding.id}",
      message: data
    )
  end
end
