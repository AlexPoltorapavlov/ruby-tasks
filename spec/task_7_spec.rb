require_relative 'spec_helper'
require_relative '../task_7'

describe 'task_7' do
  it do
    expect(domain_name('http://google.com')).to eq('google')
    expect(domain_name('http://google.co.jp')).to eq('google')
    expect(domain_name('www.xakep.ru')).to eq('xakep')
    expect(domain_name('https://youtube.com')).to eq('youtube')
  end
end
