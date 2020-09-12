class UserBidsSerializer < ActiveModel::Serializer
  attributes :id, :bid, :status
  belongs_to :listing, serializer: ListingIndexSerializer
  has_many :messages, serializer: MessagesSerializer
end
