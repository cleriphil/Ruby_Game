class Item < ActiveRecord::Base
  def self.find_by_description(item)
    returned_items = DB.exec(SELECT * FROM items WHERE description = '#{item}';)
    items = []
    returned_items.each() do |item|
      description = item.fetch('description')
      items.push(Item.new({:description => description})
    end
    items
  end
end
