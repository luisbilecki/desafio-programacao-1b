require 'rails_helper'

RSpec.describe Sale, type: :model do
  it 'is valid' do
    sale = create(:sale)
    expect(sale).to be_valid
  end

  context 'validates' do
    it { is_expected.to validate_presence_of(:buyer) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity) }
  end

  context 'Instance Methods' do
    it '#format_money' do
      sale = create(:sale)
      expect(sale.format_money).to start_with("$")
    end
  end

end
