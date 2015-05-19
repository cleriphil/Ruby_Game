require('bundler/setup')
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }






















get('/page9') do
  @error = false
  erb(:page9)
end

post('/page9') do
  item_id = params.fetch('item')
  item = Item.find(item_id)
  if item.description == 'torch'
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
    item = Item.find_by_description('sword')
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
