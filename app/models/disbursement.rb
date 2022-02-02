class Disbursement < ActiveRecord::Base
  belongs_to :order
  belongs_to :fee_configuration

  validates :processed_at, presence: true
  validates :value, presence: true
  validates :status, presence: true

  scope :find_by_merchant, (lambda do |merchant_id|
    joins(:merchant).where(id: merchant_id)
  end)

  scope :find_by_day_week, (lambda do |day_week|
    where('from_date < ? AND to_date > ?', day_week, day_week + 6.days)
  end)

end