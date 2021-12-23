module Api
  module V1
    class Disbursements
      class Fetcher
        class << self
          def call(merchant_id, first_day_week)
            return Disbursement.find_by_day_week(first_day_week) unless merchant_id

            Disbursement.find_by_day_week(first_day_week).find_by_merchant(merchant_id)
          end
        end
      end
    end
  end
end