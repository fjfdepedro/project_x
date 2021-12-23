class Api::V1::DisbursementsController < ApplicationController
  # GET /list
  def list
    @disbursements = Api::V1.Orders.Disbursements.call(disbursements_params)

    render json: @disbursements,
           serializer: Api::V1::DisbursementSerializer
  end
end
