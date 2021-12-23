FactoryBot.define do
  factory :order, class: Order do
    merchant
    shopper
    amount { 34 }
    status { 'completed' }
  end
end
