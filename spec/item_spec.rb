require('spec_helper')

describe(Item) do
  it('returns the item by its description') do
    item1 = Item.create({:description => 'torch'})
    expect(Item.find_by_description('torch')).to(eq(item1))
  end
end
