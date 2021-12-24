# spec/models/order.rb

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:merchant_item) { create(:merchant) }
  let(:shopper_item) { create(:shopper) }

  subject {
    described_class.new(merchant: merchant_item,
                        shopper: shopper_item,
                        amount: 234.7,
                        status: 'pending')
  }

  describe 'Associations' do
    it { should belong_to(:merchant) }
    it { should belong_to(:shopper) }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a valid amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a valid status' do
      should_not allow_value('nostatus').for(:status)
    end
  end
end
