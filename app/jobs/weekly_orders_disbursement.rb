class WeeklyOrdersDisbursement < ActiveJob::Base
  def perform
    with_audit do
      orders_for_current_week = Order.find_by_day_week(day_week);
      results = orders_for_current_week.map do |order|
        CreateDisbursement.new(order).call
      end

      results.all?(&:ok?) ? "ok" : results.reject(&:ok?).map(&:errors).to_sentence
    end

    def with_audit
      result = yield 
      errors = results if result != "ok" 
      status = result == "ok" ? :success : :failed

      Audit.create!(status:status , errors:errors, performed_at: Time.current)
    end
  end
end