class Ingredient
  attr_reader :name, :unit, :calories

  def initialize(food_data)
    @name = food_data[:name]
    @unit = food_data[:unit]
    @calories = food_data[:calories]
  end
end
