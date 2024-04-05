require_relative 'spec_helper'
require_relative '../task_4'

describe 'task_4' do
  it do
    expect(maskify('4556364607935616')).to eq('############5616')
    expect(maskify('1')).to eq('1')
    expect(maskify('11111')).to eq('#1111')
    expect(maskify('Nananananananananananananananana Batman!')).to eq('####################################man!')
  end
end
