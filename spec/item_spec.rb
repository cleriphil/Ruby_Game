require('spec_helper')
require 'pry'

describe(Item) do
  it('returns the item by its description') do
    item1 = Item.create({:description => 'Sword'})
    expect(Item.find_by_description('Sword')).to(eq(item1))
  end
end
