class Item < ActiveRecord::Base
  validates :description, uniqueness: true



  def self.find_by_description(item)
    returned_items = Item.all.select { |m| m.description == item } # active record way of selecting from database
    chosen_item = returned_items.first
    # item_id = chosen_item.id
    Item.find(chosen_item.id)
  end
end
