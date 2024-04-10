require_relative 'spec_helper'
require_relative '../task_8'

describe 'task_8' do
  it do
    expect(sanitize('_')).to eq('\_')
    expect(sanitize('*')).to eq('\*')
    expect(sanitize(',')).to eq('\,')
    expect(sanitize('[')).to eq('\[')
    expect(sanitize(']')).to eq('\]')
    expect(sanitize('(')).to eq('\(')
    expect(sanitize(')')).to eq('\)')
    expect(sanitize('~')).to eq('\~')
    expect(sanitize('`')).to eq('\`')
    expect(sanitize('>')).to eq('\>')
    expect(sanitize('#')).to eq('\#')
    expect(sanitize('+')).to eq('\+')
    expect(sanitize('-')).to eq('\-')
    expect(sanitize('=')).to eq('\=')
    expect(sanitize('|')).to eq('\|')
    expect(sanitize('{')).to eq('\{')
    expect(sanitize('}')).to eq('\}')
    expect(sanitize('.')).to eq('\.')
    expect(sanitize('!')).to eq('\!')
    expect(sanitize('Hello, world!')).to eq('Hello\, world\!')
    expect(sanitize('@?')).to eq('@?')
  end
end
