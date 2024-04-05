require_relative 'spec_helper'
require_relative '../task_5'

describe 'task_5' do
  def do_test(instance, method, expected, *args)
    actual = method.bind(instance).call(*args)
    message = "#{method.name}(#{args.join(', ')}) should return #{expected}, but got #{actual.inspect}"
    expect(actual).to eq(expected), message
  end

  item_count      = PaginationHelper.instance_method(:item_count)
  page_count      = PaginationHelper.instance_method(:page_count)
  page_item_count = PaginationHelper.instance_method(:page_item_count)
  page_index      = PaginationHelper.instance_method(:page_index)

  it 'for 24 items and 10 items per page' do
    collection = (1..24).to_a
    helper = PaginationHelper.new(collection, 10)

    do_test(helper, page_count, 3)
    do_test(helper, item_count, 24)

    do_test(helper, page_item_count, 10, 1)
    do_test(helper, page_item_count, 4, 2)
    do_test(helper, page_item_count, -1, 3)

    do_test(helper, page_index, 2, 23)
    do_test(helper, page_index, -1, 24)
    do_test(helper, page_index, -1, 40)
    do_test(helper, page_index, 0, 3)
    do_test(helper, page_index, -1, -1)
    do_test(helper, page_index, -1, -23)
    do_test(helper, page_index, -1, -15)
  end

  it 'for 0 items and 10 items per page' do
    empty = PaginationHelper.new([], 10)

    do_test(empty, page_count, 0)
    do_test(empty, item_count, 0)
    do_test(empty, page_index, -1, 0)
    do_test(empty, page_item_count, -1, 0)
  end
end
