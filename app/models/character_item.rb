class CharacterItem < ActiveRecord::Base
  belongs_to :character
  belongs_to :item

  def after_save
    Event.log("character_log", "Item Added..")
  end

  def name
    (self.item) ? self.item.name : ""
  end

  def category
    (self.item) ? self.item.category : ""
  end

  def subcategory
    (self.item) ? self.item.subcategory : ""
  end

  def weight
    (self.item) ? self.item.weight : ""
  end

end
