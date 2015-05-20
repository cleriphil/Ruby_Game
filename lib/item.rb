class Item < ActiveRecord::Base
  def self.find_by_description(item)
    returned_items = Item.all.select { |m| m.description == item } # active record way of selecting from database
    chosen_item = returned_items.first
    item_id = chosen_item.id
    Item.find(item_id)
  end
end
