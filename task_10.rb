# frozen_string_literal: true

# Написать функцию, которая возращает сумму целых чисел от 1-го до заданного значения

def numbers_sum(end_num)
  range_sum = (1..end_num)
  sum = 0
  range_sum.each do |i|
    sum += i
  end
  sum
end

puts(numbers_sum(3))
