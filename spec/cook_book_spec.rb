require 'rspec'
require './lib/ingredient'
require './lib/pantry'
require './lib/cook_book'
require './lib/recipe'

RSpec.describe CookBook do 
  before(:each) do 
    @cookbook = CookBook.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  it 'exists' do 
    expect(@cookbook).to be_instance_of(CookBook)
  end

  it 'starts with no recipes and can add them' do 
    expect(@cookbook.recipes).to eq([])

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
  end

  xit 'can list all ingredients in a cookbook' do
   
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it 'can list the highest calorie meal in a cookbook' do
    
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    
   
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
  end

  it 'can name the date the cookbook was created' do
    
    expect(@cookbook.date).to eq("09-25-2022")
  end

  it 'can give a summary ' do

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
  
    
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    array = [
      {
        :name=>"Mac and Cheese",
        :details=>
                {:ingredients=>
                  [
                    {:ingredient=>"Macaroni",
                       :amount=>"8 oz"
                       },
                    {:ingredient=>"Cheese",
                       :amount=>"2 C"
                    }
                  ],
                  :total_calories=>440
                  }
                  },
      {
        :name=>"Burger",
        :details=>
                {:ingredients=>
                  [
                    {:ingredient=>"Ground Beef",
                       :amount=>"4 oz"
                     },
                      {:ingredient=>"Bun",
                         :amount=>"100 g"
                         }
                         ],
        :total_calories=>500}}]

    expect(@cookbook.summary).to eq(array)
  end
end