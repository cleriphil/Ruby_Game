require('spec_helper')
describe(Item) do
  it {should validate_uniqueness_of(:description)}


  it('returns the item by its description') do
    item1 = Item.create({:description => 'Sword'})
    expect(Item.find_by_description('Sword')).to(eq(item1))
  end
end
