# frozen_string_literal: true

# Напишите функцию, которая принимает список чисел и строк и возвращает новый список с отфильтрованными строками
# filter_list([1,2,'a','b']) == [1,2]
# filter_list([1,'a','b',0,15]) == [1,0,15]
# filter_list([1,2,'aasf','1','123',123]) == [1,2,123]

def filter_list(list)
  list.select { |item| item.is_a?(Numeric) }
end
