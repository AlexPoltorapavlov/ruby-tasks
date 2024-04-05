require_relative 'spec_helper'
require_relative '../task_2'

describe 'task_2' do
  it do
    expect(likes([])).to  eq('no one likes this')
    expect(likes(['Peter'])).to eq('Peter likes this')
    expect(likes(['Jacob', 'Alex'])).to eq('Jacob and Alex like this')
    expect(likes(['Max', 'John', 'Mark'])).to eq('Max, John and Mark like this')
    expect(likes(['Alex', 'Jacob', 'Mark', 'Max'])).to eq('Alex, Jacob and 2 others like this')
  end
end
