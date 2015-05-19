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
