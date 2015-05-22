require 'spec_helper'
Capybara.app = Sinatra::Application



describe('the path of accepting the kings generous gifts', {:type => :feature}) do
  it('allows the user to accept and view gifts') do
    visit('/')
    click_button('Accept the King\'s Generous Gifts')
    expect(page).to have_content('List of your items')
    expect(page).to have_content('Snack')
  end
end

describe('The path of routing error', {:type => :feature}) do
  it('allows the user to enter path') do
    visit('/')
    click_button('Accept the King\'s Generous Gifts')
    click_button('Quest Begins Here')
    fill_in('first_spot', :with => 'get')
    fill_in('second_spot', :with => 'cave_entrance')
    click_button('Find the path')
    visit('/page2')
    expect(page).to have_content('The path is now clear!')
  end
end

describe('The path of routing error for wrong answer', {:type => :feature}) do
  it('directs user to error message') do
    visit('/page1')
    fill_in('first_spot', :with => 'get')
    fill_in('second_spot', :with => 'whatever')
    click_button('Find the path')
    expect(page).to have_content("The minstrel doesn't know this ditty.")
  end
end

describe('the path of the cockroaches enemy page', {:type => :feature}) do
  it('display the cockroaches and a dropdown of items the user will use to fight them off') do
    test_item = Item.create({:description => 'Torch'})
    visit('/page9')
    select('Torch')
    click_button('submit')
    expect(page).to have_content('scurry')
  end
end

describe('the path of the cockroaches enemy page', {:type => :feature}) do
  it('display the cockroaches and a dropdown of items the user will use to fight them off') do
    test_item1 = Item.create({:description => 'torch'})
    test_item2 = Item.create({:description => 'sword'})
    visit('/page9')
    select('sword')
    click_button('submit')
    expect(page).to have_content('a key')
  end
end
