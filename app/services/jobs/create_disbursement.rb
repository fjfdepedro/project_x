class CreateDisbursement
  class << self
    def call(order)
      merchant = Merchant.find(order.merchant_id)
      fee_configurations_type = FeeConfigurationsType.find(merchant.fee_configurations_type_id)
      fee_configuration = FeeConfiguration.find_by_fee_configurations_type(fee_configurations_type.id).find_by_amount(order.amount)

      fee = amount * fee_percentage / 100

      Disbursement.new(
        order: order,
        fee_configuration: fee_configuration,
        processed_at: Time.current,
        value: fee
      )
    end
  end
end