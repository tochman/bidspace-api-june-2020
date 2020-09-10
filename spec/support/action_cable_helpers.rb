# frozen_string_literal: true

module ActionCableHelpers
  def channells
    ActionCable.server.pubsub.instance_variable_get(:@channels_data)
  end
end
