class Message < ApplicationRecord
  belongs_to :bidding
  belongs_to :sender, class_name: 'User'
end
