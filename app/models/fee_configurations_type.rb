
class FeeConfigurationsType < ActiveRecord::Base
  has_many :fee_configurations
  has_many :merchants
end
