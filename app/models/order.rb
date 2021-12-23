class Order < ActiveRecord::Base
  validates :amount, presence: true
  validates :status, presence: true, status: true
  belongs_to :merchant
  belongs_to :shopper
  has_one :disbursement

  scope :find_by_day_week, (lambda do |day_week|
    where('from_date < ? AND to_date > ?', day_week, day_week + 6.days)
  end)

end
