RSpec.describe Api::V1::DisbursementsController do
  describe 'GET list' do
    it 'returns a valid response, http=200' do
      expect(response.status).to eq 200
    end

    it 'renders the json schema' do
      expect(response).to match_response_schema('disbursement')
    end
  end
end
