class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new { 
      |stock, ingredient| stock[ingredient] = 0
    }
      
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end
  
  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, required_amount|
      @stock[ingredient] >= required_amount
    end
  end
end
