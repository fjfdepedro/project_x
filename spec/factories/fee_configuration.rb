FactoryBot.define do
  factory :fee_configuration, class: FeeConfiguration do
    fee_configurations_type
    fee_percentage { 1.0 }
    min_amount { 0 }
    max_amount { 50 }
  end
end
