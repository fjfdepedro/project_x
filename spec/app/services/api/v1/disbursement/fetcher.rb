RSpec.describe Api::V1::Disbursements::Fetcher do
  describe '.call' do
    let(:merchant) { create(:merchant) }
    let(:merchant_id) { merchant.id }
    let(:first_day_week) { Time.now }
    let(:disbursements_from_a_merchant) { build_list(:disbursements, 5, merchant: merchant) }
    let(:disbursements_from_a_merchant_all) { build_list(:disbursements, 10) }

    it 'returns Disbursements from a merchant and first_day_week' do
      disbursements = described_class.call(merchant_id, first_day_week)
      expect(disbursements).to match_array(disbursements_from_a_merchant)
    end

    it 'returns Disbursements only from first_day_week' do
      disbursements = described_class.call(first_day_week)
      expect(disbursements).to match_array(disbursements_from_a_merchant_all)
    end
  end
end