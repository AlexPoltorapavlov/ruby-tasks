require_relative 'spec_helper'
require_relative '../task_12'

describe 'task_12' do
  context 'when valid inn' do
    it do
      %w[
        473223342390
        165170875730
        067588705903
        636608026922
        0371981671
        4974042100
        5199578552
        2254973127
      ].each do |inn|
        expect(INNValidator.new(inn: inn)).to be_valid
      end
    end
  end

  context 'when invalid characters' do
    it do
      expect(INNValidator.new(inn: Faker::Lorem.characters)).not_to be_valid
    end
  end

  context 'when invalid size' do
    it do
      15.times.each do |size|
        next if [10, 12].include?(size)

        expect(INNValidator.new(inn: Faker::Number.number(digits: size).to_s)).not_to be_valid
      end
    end
  end
end
