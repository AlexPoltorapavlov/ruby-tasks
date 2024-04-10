require_relative 'spec_helper'
require_relative '../task_13'

describe 'task_13' do
  let(:valid_bik) { '044525957' }

  context 'when bik invalid' do
    it do
      expect(CorAccountValidator.new(account: Faker::Lorem.word, bik: Faker::Lorem.characters)).not_to be_valid
      15.times.each do |size|
        next if size == 9

        expect(
          CorAccountValidator.new(account: Faker::Lorem.word, bik: Faker::Number.number(digits: size).to_s)
        ).not_to be_valid
      end
    end
  end

  context 'when account invalid' do
    it do
      %w[
        00000000000000000000
        12345678901234567890
        43265464554432342378
        65756742343876768321
      ].each do |cor_account|
        expect(CorAccountValidator.new(account: cor_account, bik: valid_bik)).not_to be_valid
      end

      30.times.each do |size|
        next if size == 20

        expect(
          CorAccountValidator.new(account: Faker::Number.number(digits: size).to_s, bik: valid_bik)
        ).not_to be_valid
      end
    end
  end

  context 'when valid' do
    it do
      {
        sber:          %w[044525225 30101810400000000225],
        alfa:          %w[044525593 30101810200000000593],
        center_invest: %w[046015762 30101810100000000762]
      }.each do |_key, value|
        expect(CorAccountValidator.new(account: value[1], bik: value[0])).to be_valid
      end
    end
  end
end
