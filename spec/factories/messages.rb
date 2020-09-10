FactoryBot.define do
  factory :message do
    body { "MyText" }
    bidding
    association :sender, factory: :user

  end
end
