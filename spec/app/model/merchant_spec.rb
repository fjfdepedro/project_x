# spec/models/merchant.rb

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:fee_configurations_type_item) { create(:fee_configurations_type) }

  subject {
    described_class.new(name: 'Merchant name',
                        email: 'info@flatley-rowe.com',
                        cif: '98657242F',
                        fee_configurations_type: fee_configurations_type_item)
  }

  describe 'Associations' do
    it { should belong_to(:fee_configurations_type).without_validating_presence }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a valid email' do
      should_not allow_value('infoflatley-rowe.com').for(:email)
    end
    it 'is not valid without a valid cif' do
      subject.cif = '91111111F'
      expect(subject).to_not be_valid
    end
  end
end
