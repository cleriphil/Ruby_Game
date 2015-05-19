require 'spec_helper'
Capybara.app = Sinatra::Application


describe('the path of the cockroaches enemy page', {:type => :feature}) do
  it('display the cockroaches and a dropdown of items the user will use to fight them off') do
    test_item = Item.create({:description => 'torch'})
    visit('/page9')
    select('torch')
    click_button('submit')
    expect(page).to have_content('Break time')
  end
end

describe('the path of the cockroaches enemy page', {:type => :feature}) do
  it('display the cockroaches and a dropdown of items the user will use to fight them off') do
    test_item1 = Item.create({:description => 'torch'})
    test_item2 = Item.create({:description => 'sword'})
    visit('/page9')
    select('sword')
    click_button('submit')
    expect(page).to have_content('Oh no!')
  end
end
