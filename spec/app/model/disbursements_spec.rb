# spec/models/fee_configurations_type_spec.rb

require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  let(:order_item) { create(:order) }
  let(:fee_configurations_item) { create(:fee_configuration) }

  subject {
    described_class.new(order: order_item,
                        fee_configuration: fee_configurations_item,
                        processed_at: Time.current,
                        value: 0.24,
                        status: 'done')
  }

  describe 'Associations' do
    it { should belong_to(:order).without_validating_presence }
    it { should belong_to(:fee_configuration).without_validating_presence }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    %i[processed_at value status].each do |field|
      it { expect(subject).to validate_presence_of(field) }
    end
  end
end
