require('bundler/setup')
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/page1') do
  erb(:page1)
end

get('/page2') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "get" && answer2 == "cave_entrance"
    erb(:page2)
  else
    erb(:error)
  end
end

get('/page3') do
  answer1 = params.fetch('first_spot')
  answer2 = params.fetch('second_spot')
  if answer1 == "new" && answer2 == "save"
    # @items = Item.all()
    erb(:page3)
  else
    erb(:error)
  end
end
