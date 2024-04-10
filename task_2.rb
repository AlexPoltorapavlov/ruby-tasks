# frozen_string_literal: true

# Вы, наверное, знаете систему лайков по Facebook и другим страницам.
# Люди могут ставить лайки постам в блогах, изображениям и другим элементам.
# Мы хотим создать текст, который должен отображаться рядом с таким элементом.
# Реализуйте функцию, которая принимает массив, содержащий имена людей, которым понравился предмет.
# Он должен возвращать отображаемый текст, как показано в примерах:
# []                                -->  "no one likes this"
# ["Peter"]                         -->  "Peter likes this"
# ["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
# ["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
# ["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"
# Примечание. При наличии 4 и более имен число в «and 2 others» просто увеличивается.

def likes(names)
  case names.length
  when 0 then 'no one likes this'
  when 1 then "#{names[0]} likes this"
  when 2 then "#{names[0]} and #{names[1]} like this"
  when 3 then "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.length - 2} others like this"
  end
end
