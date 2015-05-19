ENV['RACK_ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
require('./app')


RSpec.configure do |config|
  config.after(:each) do
    Item.all().each() do |band|
      band.destroy()
    end
  end
end
