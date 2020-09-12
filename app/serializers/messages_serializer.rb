class MessagesSerializer < ActiveModel::Serializer
  attributes :id, :body, :sender

  def sender
    {
      id: object.sender.id,
      email: object.sender.email
    }
  end
end
