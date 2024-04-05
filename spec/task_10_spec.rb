require_relative 'spec_helper'
require_relative '../task_10'

describe 'task_10' do
  let(:num) { Faker::Number.between(from: 2, to: 1000) }

  it do
    expect(numbers_sum(num)).to eq((1..num).sum)
  end
end
