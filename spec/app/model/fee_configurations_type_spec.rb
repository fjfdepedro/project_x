# spec/models/fee_configurations_type_spec.rb

require 'rails_helper'

RSpec.describe FeeConfigurationsType, type: :model do
  subject {
    described_class.new(name: 'Fee config type name',
                        description: 'Fee config type description')
  }

  describe 'Associations' do
    it { should have_many(:fee_configurations).without_validating_presence }
    it { should have_many(:merchants).without_validating_presence }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
