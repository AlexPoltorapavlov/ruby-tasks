# frozen_string_literal: true

# Обычно, когда вы что-то покупаете, вас спрашивают, верен ли номер вашей кредитной карты, номер телефона или ответ на
# ваш самый секретный вопрос.
# Однако, поскольку кто-то может заглянуть вам через плечо, вы не хотите, чтобы это отображалось на вашем экране.
# Вместо этого мы маскируем это.

# Ваша задача — написать функцию maskify, которая заменяет все символы, кроме последних четырех, на «#».
# Примеры:
# "4556364607935616" --> "############5616"
# "64607935616" -->      "#######5616"
# "1" -->                "1"
# "" -->                 ""
# "Skippy" --> "##ippy"
# "Nananananananananananananananana Batman!" --> "####################################man!"

def maskify(cc)
  return cc if cc.size <= 4

  mask_size = cc.size - 4
  '#' * mask_size + cc[-4..]
end
