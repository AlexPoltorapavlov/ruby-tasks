require_relative 'spec_helper'
require_relative '../task_3'

describe 'task_3' do
  it do
    expect(filter_list([1,2,'a','b'])).to eq([1,2])
    expect(filter_list([1,'a','b',0,15])).to eq([1,0,15])
    expect(filter_list([1,2,'aasf','1','123',123])).to eq([1,2,123])
    expect(filter_list([-1, 5.5, 'dsdas', :dsad, 3])).to eq([-1,5.5,3])
  end
end
