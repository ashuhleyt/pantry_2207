require './lib/ingredient'
require './lib/pantry'
require 'rspec'

RSpec.describe Pantry do 
  before (:each) do 
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it 'exists' do 
    expect(@pantry).to be_instance_of(Pantry)
  end
  
  it 'has a stock of items' do
    @pantry.stock

    expect(@pantry.stock).to eq({})
  end

  it 'can check the pantry stock' do 
    @pantry.stock_check(@ingredient1)

    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it 'can add items to the pantry' do 
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    @pantry.restock(@ingredient2, 7)

    expect(@pantry.stock_check(@ingredient1)).to eq(15)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end
end