# frozen_string_literal: true

# Вы живете в городе Картезия, где все дороги расположены идеальной сеткой.
# Вы пришли на встречу на десять минут раньше и решили воспользоваться возможностью прогуляться.
# Город предоставляет своим гражданам приложение для создания ходьбы на их телефонах — каждый раз, когда вы нажимаете
# кнопку, оно отправляет вам массив однобуквенных строк, представляющих направления для ходьбы (например,
# ['n', 's', 'w', 'е']).
# Вы всегда проходите только один квартал для каждой буквы (направления), и вы знаете, что прохождение одного городского
# квартала занимает у вас одну минуту, поэтому создайте функцию, которая будет возвращать true, если прогулка, которую
# предлагает вам приложение, займет у вас ровно десять минут (вы не хочу ни рано, ни поздно!) и, конечно же, вернет вас
# в исходную точку.
# В противном случае верните false.

# Примечание. Вы всегда получите действительный массив, содержащий случайный набор букв направления (только «n», «s»,
# «e» или «w»). Он никогда не выдаст вам пустой массив (это не прогулка, это стояние на месте!).

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def is_valid_walk(walk)
  return false unless walk.size == 10

  ns = 0
  ew = 0
  walk.each do |direction|
    case direction
    when 'n' then ns += 1
    when 's' then ns -= 1
    when 'e' then ew += 1
    when 'w' then ew -= 1
    end
  end
  ns.zero? && ew.zero?
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
