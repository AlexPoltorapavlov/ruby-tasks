require_relative 'spec_helper'
require_relative '../task_9'

describe 'task_9' do
  it('basic recipes') do
    expect(
      cakes(
        { 'flour' => 500, 'sugar' => 200,
          'eggs' => 1 }, { 'flour' => 1200, 'sugar' => 1200, 'eggs' => 5, 'milk' => 200 }
      )
    ).to eq(2)
    expect(
      cakes(
        { 'cream' => 200, 'flour' => 300, 'sugar' => 150, 'milk' => 100, 'oil' => 100 },
        { 'sugar' => 1700, 'flour' => 20_000, 'milk' => 20_000, 'oil' => 30_000, 'cream' => 5000 }
      )
    ).to eq(11)
  end

  it('missing ingredient') do
    expect(
      cakes(
        { 'apples' => 3, 'flour' => 300, 'sugar' => 150, 'milk' => 100, 'oil' => 100 },
        { 'sugar' => 500, 'flour' => 2000, 'milk' => 2000 }
      )
    ).to eq(0)
  end

  it('not enough ingredients') do
    expect(
      cakes(
        { 'apples' => 3, 'flour' => 300, 'sugar' => 150, 'milk' => 100, 'oil' => 100 },
        { 'sugar' => 500, 'flour' => 2000, 'milk' => 2000, 'apples' => 15, 'oil' => 20 }
      )
    ).to eq(0)
  end

  it('no ingredients available') do
    expect(cakes({ 'eggs' => 4, 'flour' => 400 }, {})).to eq(0)
  end

  it('exactly enough ingredients for 1 cake') do
    expect(
      cakes(
        { 'cream' => 1, 'flour' => 3, 'sugar' => 1, 'milk' => 1, 'oil' => 1, 'eggs' => 1 },
        { 'sugar' => 1, 'eggs' => 1, 'flour' => 3, 'cream' => 1, 'oil' => 1, 'milk' => 1 }
      )
    ).to eq(1)
  end
end
