FactoryBot.define do
  factory :shopper, class: Shopper do
    name { 'Name' }
    email { 'info@flatley-rowe.com' }
    nif { '98657242F' }
  end
end
