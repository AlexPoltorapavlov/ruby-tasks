require_relative 'spec_helper'
require_relative '../task_1'

describe 'task_1' do
  def test(n, expected)
    expect(solution(n)).to eq(expected), "Expected #{expected}, got #{solution(n)}"
  end

  it do
    test(10, 23)
    test(20, 78)
    test(200, 9168)
    test(1000, 233168)
  end
end
