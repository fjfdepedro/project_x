class Shopper < ActiveRecord::Base
  validates :email, presence: true, email: true
  validates :nif, presence: true, nif: true

  has_many :orders

  attr_accessor :name, :email, :nif
end
