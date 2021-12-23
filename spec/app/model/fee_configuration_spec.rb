# spec/models/fee_configuration_spec.rb

require 'rails_helper'

RSpec.describe FeeConfiguration, type: :model do
  let(:fee_configurations_type_item) { create(:fee_configurations_type) }

  subject {
    described_class.new(fee_percentage: 1.0,
                        min_amount: 0,
                        max_amount: 50,
                        fee_configurations_type: fee_configurations_type_item)
  }

  describe 'Associations' do
    it { should belong_to(:fee_configurations_type) }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a valid fee_percentage' do
      subject.fee_percentage = '1.0'
      expect(subject).to be_valid
    end
    it 'is not valid without a valid min_amount' do
      subject.min_amount = 3.0
      expect(subject).to be_valid
    end
    it 'is not valid without a valid max_amount' do
      subject.min_amount = '4'
      expect(subject).to be_valid
    end
  end
end
