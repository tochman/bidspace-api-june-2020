class BiddingsSerializer < ActiveModel::Serializer
  attributes :id, :bid, :status
  belongs_to :user, serializer: UserSerializer
  has_many :messages
end
