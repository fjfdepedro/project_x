class FeeConfiguration < ActiveRecord::Base
  belongs_to :fee_configurations_type
  has_many :disbursement

  scope :find_by_fee_configurations_type, (lambda do |fee_configurations_type_id|
    where(fee_configurations_type_id: fee_configurations_type_id)
  end)

  scope :find_by_amount, (lambda do |amount|
    where('min_amount > ? AND max_amount < ?', amount)
  end)
end
