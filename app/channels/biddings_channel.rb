class BiddingsChannel < ApplicationCable::Channel
  def subscribed
    stream_from bidding_identifier
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def bidding_identifier
    if params[:room][:bidding_id]
      channel = "biddings_channel_#{params[:room][:bidding_id]}"
    else
      connection.transmit identifier: params, message: 'No params specified.'
      reject && return
    end
    channel
  end
end
