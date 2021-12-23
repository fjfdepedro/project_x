class Api::V1::DisbursementSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :order_id,
    :fee_configuration_id,
    :processed_at,
    :value,
    :status
  )
end