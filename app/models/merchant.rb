class Merchant < ActiveRecord::Base
  validates :email, presence: true, email: true
  validates :cif, presence: true, nif: true
  validates :name, presence: true

  has_many :orders
  belongs_to :fee_configurations_type

  attr_accessor :name, :email, :cif
end
