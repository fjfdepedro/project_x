# spec/models/shopper.rb

require 'rails_helper'

RSpec.describe Shopper, type: :model do
  subject {
    described_class.new(name: 'Shopper name',
                        email: 'shopper@ggggg.com',
                        nif: '23246263W')
  }

  describe 'Associations' do
    it { should have_many(:orders).without_validating_presence }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a valid email' do
      should_not allow_value('shopperggggcom').for(:email)
    end
    it 'is not valid without a valid nif' do
      should_not allow_value('444444444G').for(:nif)
    end
  end
end
