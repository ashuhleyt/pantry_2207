class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    result = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
      result << ingredient.name if !result.include?(ingredient.name)
      end
    end
    result
  end

  def highest_calorie_meal
    @recipes.max_by {|recipe| recipe.total_calories}
  end

  def date
    Time.now.strftime("%m-%d-%Y")
  end

  def summary
    array = [Hash.new(0), Hash.new(0)]
  end
end
