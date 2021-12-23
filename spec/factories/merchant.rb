FactoryBot.define do
  factory :merchant, class: Merchant do
    name { 'Name' }
    email { 'info@flatley-rowe.com' }
    cif { '98657242F' }
    status { 'active' }
    fee_configurations_type
  end
end
