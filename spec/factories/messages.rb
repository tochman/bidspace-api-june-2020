FactoryBot.define do
  factory :message do
    body { "MyText" }
    bidding { nil }
    sender { nil }
  end
end
