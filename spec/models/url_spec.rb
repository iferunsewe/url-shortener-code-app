require 'rails_helper'

RSpec.describe Url, type: :model do
  it { should validate_presence_of(:original) }

  it 'can generate a random alpha numeric string' do
    alpha_string = described_class.generate_random_alpha_numeric_string(6)
    expect(alpha_string).to match(/^[a-zA-Z0-9]{6,}$/)
  end
end
