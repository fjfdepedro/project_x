class Merchant < ActiveRecord::Base
  validates :email, presence: true, email: true
  validates :cif, presence: true

  validates_presence_of :name

  has_many :orders
  belongs_to :fee_configurations_type

end
