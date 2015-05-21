require('bundler/setup')
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('pry')

get('/') do
  Item.all.each() do |item|
    item.destroy
  end
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

post('/page1') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "get" && answer2 == "cave_entrance"
    erb(:page2)
  else
    @error = true
      if answer1 == "get"
        @error_b = true
      elsif answer2 == "cave_entrance"
        @error_a = true
      end
    erb(:page1)
  end
end

get('/page2') do
  erb(:page2)
end

post('/page2') do
  key = Item.create({:description => "Key"})
  @items = Item.all()
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "new" && answer2 == "save"
    erb(:page3)
  else
    @error = true
    if answer1 == "new"
      @error_b = true
    elsif answer2 == "save"
      @error_a = true
    end
    erb(:page2)
  end
end

get('/page3') do
  @items = Item.all()
  erb(:page3)
end

post('/page3') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  answer3 = params.fetch('third_spot')
  @items = Item.all()
  if answer1 == "6" && ((answer2 == "push") | (answer2 == "push()")) && ((answer3 == "join") | (answer3 == "join()"))
    Item.create({:description => "Rope"})
    erb(:page4)
  else
    @error = true
    if answer1 == "6"
      @error_b = true
    elsif ((answer2 == "push") | (answer2 == "push()")) && ((answer3 == "join") | (answer3 == "join()"))
      @error_a = true
    end

    erb(:page3)
  end
end

get('/page4') do
  erb(:page4)
end

post('/page4') do
  @items = Item.all()
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "find" && answer2 == "total_potions"
    found_item = Item.find_by_description("Potion")
    found_item.delete
    erb(:page5)
  else
    @error = true
    if answer1 == "find"
      @error_b = true
    elsif answer2 == "total_potions"
      @error_a = true
    end
    erb(:page4)
  end
end

get('/page5') do
  erb(:page5)
end

post('/page5') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "params" && answer2 == "key_id"
    erb(:page6)
  else
    @error = true
    if answer1 == "params"
      @error_b = true
    elsif answer2 == "key_id"
      @error_a = true
    end
    erb(:page5)
  end
end

get('/page6') do
  erb(:page6)
end

post('/page6') do
  @error = true
  erb(:page6)
end

get('/page7') do
  erb(:page7)
end

post('/page7') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer2 == "end" && ((answer1 == 'upcase') | (answer1 == 'upcase()') | (answer1 == 'upcase!') | (answer1 == 'upcase!()'))
    erb(:page8)
  else
    @error = true
    if answer2 == "end"
      @error_a = true
    elsif ((answer1 == 'upcase') | (answer1 == 'upcase()') | (answer1 == 'upcase!') | (answer1 == 'upcase!()'))
      @error_b = true
    end
    erb(:page7)
  end
end

get('/page8') do
  erb(:page8)
end

post('/page8') do
  item_id = params.fetch('item')
  item = Item.find(item_id)
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  answer3 = params.fetch('third_spot')
  if item.description == 'Torch'
    @error = 1
    erb(:page8)
  elsif item.description == 'iPod'
    @error = 2
    erb(:page8)
  elsif item.description == 'Snack'
    @error = 3
    erb(:page8)
  elsif item.description == 'Rope'
    @error = 4
    erb(:page8)
  elsif item.description == 'Key'
    @error = 5
    erb(:page8)
  else # sword is chosen
    if answer1 == "each" && ((answer2 == "shift") | (answer2 == "shift()")) && answer3 == "part"
      erb(:page9)
    else
      @error = true
      if answer1 == "each" && ((answer2 == "shift") | (answer2 == "shift()"))
        @error_a = true
      elsif answer3 == "part"
        @error_b = true
      end
      erb(:page8)
    end
  end
end

get('/page9') do
  erb(:page9)
end

post('/page9') do
  item_id = params.fetch('item')
  item = Item.find(item_id)
  if item.description == 'Torch'
    erb(:page10)
  elsif item.description == 'Sword'
    @error = 1
    erb(:page9)
  elsif item.description == 'iPod'
    @error = 2
    erb(:page9)
  elsif item.description == 'Snack'
    @error = 3
    erb(:page9)
  elsif item.description == 'Rope'
    @error = 4
    erb(:page9)
  else item.description == 'Key'
    @error = 5
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
  if(answer1 == 'init')&(answer2 == 'add .')&(answer3.include?('commit -m "'))
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
  if (answer == 'shuffle') | (answer == 'shuffle()') | (answer == 'shuffle!') | (answer == 'shuffle!()')
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
    item.update({:description => 'Enchanted Sword'})
    @monster = Enemy.create({:name => "Niliathan"})
    @error = false
    erb(:page13)
  else
    @error = true
    erb(:page12)
  end
end

get('/page13') do
  @monster = Enemy.all.first
  erb(:page13)
end

post('/page13') do
  answer1 = params.fetch('answer1').to_i
  answer2 = params.fetch('answer2')
  if (answer2 =='chop') | (answer2 == 'chop()') | (answer2 == 'chop!') | (answer2 == 'chop!()')
    @monster = Enemy.all.first
    @monster = @monster.chop_number_of_times(answer1)
    if @monster.name.length == 3
      Item.all.each() do |item|
        item.destroy
      end
      Enemy.all.each() do |enemy|
        enemy.destroy
      end
      erb(:page14)
    elsif @monster.name.length > 3
      @over3error = true
      erb(:page13)
    else
      @under3error = true
      @monster.update({:name => "Niliathan"})
      erb(:page13)
    end
  else
    @choperror = true
    @monster = Enemy.all.first
    erb(:page13)
  end
end
