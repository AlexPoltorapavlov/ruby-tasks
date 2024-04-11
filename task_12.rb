# frozen_string_literal: true

# Допишите валидатор для ИНН

# INNValidator
class INNValidator
  attr_reader :inn

  def initialize(inn:)
    @inn = inn
  end

  def valid?
    return false unless inn =~ /^\d+$/

    case inn.length
    when 10
      valid_10_digits_inn?
    when 12
      valid_12_digits_inn?
    else
      false
    end
  end

  private

  def valid_10_digits_inn?
    coefficients = [2, 4, 10, 3, 5, 9, 4, 6, 8]
    check_number = inn.chars.last.to_i
    calculated_checksum = calculate_checksum(coefficients, inn[0...-1])

    calculated_checksum == check_number
  end

  def valid_12_digits_inn?
    coefficients_first = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
    coefficients_second = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
    check_number1 = inn.chars[-2].to_i
    check_number2 = inn.chars.last.to_i

    calculated_checksum1 = calculate_checksum(coefficients_first, inn[0...-2])
    calculated_checksum2 = calculate_checksum(coefficients_second, inn[0...-1])

    calculated_checksum1 == check_number1 && calculated_checksum2 == check_number2
  end

  def calculate_checksum(coefficients, inn_part)
    checksum = inn_part.chars.each_with_index.sum do |digit, index|
      digit.to_i * coefficients[index]
    end
    checksum % 11 % 10
  end
end
