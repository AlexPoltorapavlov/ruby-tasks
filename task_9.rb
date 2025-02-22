# frozen_string_literal: true

# Пит любит печь торты. У него есть несколько рецептов и ингредиентов. К сожалению, он не силен в математике.
# Можете ли вы помочь ему узнать, сколько тортов он сможет испечь по его рецептам?

# Напишите функцию cakes(), которая принимает рецепт (объект) и доступные ингредиенты (также объект) и возвращает
# максимальное количество тортов, которые Пит может испечь (целое число).
# Для простоты нет единиц измерения количества (например, 1 фунт муки или 200 г сахара — это просто 1 или 200).
# Ингредиенты, отсутствующие в объектах, можно принять за 0.

# Примеры:

# // must return 2
# cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
# // must return 0
# cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});

def cakes(recipe, available)
  max_cakes = Float::INFINITY

  recipe.each do |ingredient, amount|
    return 0 if available[ingredient].nil?

    cakes_with_ingredient = available[ingredient] / amount
    max_cakes = [max_cakes, cakes_with_ingredient].min
  end

  max_cakes.to_i
end
