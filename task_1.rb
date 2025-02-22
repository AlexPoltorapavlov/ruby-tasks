# frozen_string_literal: true

# Если мы перечислим все натуральные числа до 10, кратные 3 или 5, мы получим 3, 5, 6 и 9. Сумма этих кратных равна 23.
# Напишите функцию, которая вернет сумму всех чисел, кратных 3 или 5, ниже введенного числа.

def solution(number)
  (1...number).sum { |i| (i % 3).zero? || (i % 5).zero? ? i : 0 }
end
