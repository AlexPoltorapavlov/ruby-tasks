# frozen_string_literal: true

# Вы завершите работу над классом PaginationHelper, который представляет собой служебный класс, полезный для запроса
# информации о подкачке, связанной с массивом.

# Класс предназначен для приема массива значений и целого числа, указывающего, сколько элементов будет разрешено на
# каждой странице.
# Типы значений, содержащихся в коллекции/массиве, не имеют значения.

# Ниже приведены некоторые примеры использования этого класса:
# helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
# helper.page_count() # should == 2
# helper.item_count() # should == 6
# helper.page_item_count(0) # should == 4
# helper.page_item_count(1) # last page - should == 2
# helper.page_item_count(2) # should == -1 since the page is invalid

# page_index takes an item index and returns the page that it belongs on
# helper.page_index(5) # should == 1 (zero based index)
# helper.page_index(2) # should == 0
# helper.page_index(20) # should == -1
# helper.page_index(-10) # should == -1 because negative indexes are invalid

# Description/Explanation of PaginationHelper class
class PaginationHelper
  attr_reader :collection, :items_per_page

  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end

  # returns the number of items within the entire collection
  def item_count
    collection.size
  end

  # returns the number of pages
  def page_count
    (item_count.to_f / items_per_page).ceil
  end

  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    if page_index.negative? || page_index >= page_count
      -1
    else
      is_last_page = page_index == page_count - 1
      is_last_page ? item_count % items_per_page : items_per_page
    end
  end

  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index)
    if item_index.negative? || item_index >= item_count
      -1
    else
      item_index / items_per_page
    end
  end
end
