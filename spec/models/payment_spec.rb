# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe '.kinds_18n' do
    it '翻訳されたkey と 翻訳されていない value の Hash が返る' do
      expected = { '個別' => 'individual', '折半' => 'half' }
      expect(Payment.kinds_18n).to eq expected
    end
  end
end
