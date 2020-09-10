FactoryBot.define do
  factory :bidding do
    bid { 500 }
    listing
    status { 'pending' }
    user
  end
end
