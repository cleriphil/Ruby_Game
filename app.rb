require('bundler/setup')
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end

get('/page0') do
  sword = Item.create({:description => "Sword"})
  snack = Item.create({:description => "Snack"})
  ipod = Item.create({:description => "iPod"})
  potion = Item.create({:description => "Potion"})
  torch = Item.create({:description => "Torch"})
  @items = Item.all()
  erb(:page0)
end

get('/page1') do
  erb(:page1)
end

get('/page2') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "get" && answer2 == "cave_entrance"
    key = Item.create({:description => "Key"})
    erb(:page2)
  else
    erb(:error)
  end
end

get('/page3') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "new" && answer2 == "save"
    @items = Item.all()
    erb(:page3)
  else
    erb(:error)
  end
end

get('/page4') do
  rope = Item.create({:description => "Rope"})
  @items = Item.all()
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  answer3 = params.fetch('third_spot')
  if answer1 == "6" && answer2 == "push" && answer3 == "join"
    erb(:page4)
  else
    erb(:error)
  end
end

get('/page5') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "find" && answer2 == "total_potions"
    # found_item = Item.find(params.fetch('4').to_i())
    # found_item.delete
    erb(:page5)
  else
    erb(:error)
  end
end

get('/page6') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "params" && answer2 == "key_id"
    erb(:page6)
  else
    erb(:error)
  end
end

post('/page6error') do
    erb(:errordoor)
end

get('/page7') do
  erb(:page7)
end

get('/page8') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "upcase" && answer2 == "end"
    erb(:page8)
  else
    erb(:error)
  end
end

# get('/page9') do
#   answer1 = params.fetch('first_spot')
#   answer2 = params.fetch('second_spot')
#   answer3 = params.fetch('third_spot')
#   if answer1 == "each" && answer2 == "shift" && answer3 == "part"
#     erb(:page9)
#   else
#     erb(:error)
#   end
# end

get('/page9') do
  @error = false
  erb(:page9)
end

post('/page9') do
  item_id = params.fetch('item')
  item = Item.find(item_id)
  if item.description == 'Torch'
    erb(:page10)
  else
    @error = true
    erb(:page9)
  end
end

get('/page10') do
  erb(:page10)
end

post('/page10') do
  answer1 = params.fetch('answer1')
  answer2 = params.fetch('answer2')
  answer3 = params.fetch('answer3')
  if(answer1 == 'init')&(answer2 == 'add .')&(answer3.include?('commit -m'))
    erb(:page11)
  else
    @error = true
    erb(:page10)
  end
end

get('/page11') do
  erb(:page11)
end

post('/page11') do
  answer = params.fetch('answer')
  if answer == 'shuffle'
    erb(:page12)
  else
    @error = true
    erb(:page11)
  end
end

get('/page12') do
  erb(:page12)
end

patch('/page12') do
  answer = params.fetch('answer')
  if answer == "update"
    item = Item.find_by_description('Sword')
    item.update({:description => 'enchanted sword'})
    @error = false
    erb(:page13)
  else
    @error = true
    erb(:page12)
  end
end

get('/page13') do
  erb(:page13)
end

post('/page13') do
  answer1 = params.fetch('answer1').to_i
  answer2 = params.fetch('answer2')
  if (answer1 > 5) & (answer2.include?('chop'))
    erb(:page14)
  else
    @error = true
    erb(:page13)
  end
end
