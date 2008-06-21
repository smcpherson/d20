class CharacterMonster < ActiveRecord::Base
  belongs_to :character
  belongs_to :monster

  def after_save
    Event.log("character_log", "Monster Added")
  end

  def name
    (self.monster) ? self.monster.name : ""
  end

  def hp
    hp = (self.monster) ? self.monster.hit_dice.split("(")[1].to_i : ""
    (hp) ? "~"+hp.to_s+"hp" : ""
  end

  def attack
    (self.monster) ? self.monster.base_attack : ""
  end

  def initiative
    (self.monster) ? self.monster.initiative : ""
  end

  def challenge
    (self.monster) ? self.monster.challenge_rating : ""
  end

  def ac
    (self.monster) ? self.monster.armor_class.split("(")[0].to_i : ""
  end

end
