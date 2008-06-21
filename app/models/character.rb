class Character < ActiveRecord::Base
  has_many :character_items
  has_many :items, :through => :character_items
  has_many :character_monsters
  has_many :monsters, :through => :character_monsters

  # TO DEBUG:
  # message = "level: #{level}, class: #{class_type}, sql: #{sql}";
  # Event.log("test", message)

  def after_save
    Event.log("character_log", "SAVED.")
  end

  def attack_base
    level      = self.level
    class_type = self.class_type
    sql = "select base_attack_bonus from class_tables where upper(name) = upper('"+class_type+"') and level = "+level.to_s+" LIMIT 1"
    total = ClassTable.find_by_sql(sql)
    total[0].base_attack_bonus
  end

  def ac_total
    base = 10
    mod_armor  = self.ac_armor
    mod_shield = self.ac_shield
    mod_dex    = self.dexterity_mod
    mod_size   = self.size_mod
    total = base + mod_armor + mod_shield + mod_dex + mod_size
  end

  def ac_touch
    base = 10
    mod_dex    = self.dexterity_mod
    mod_size   = self.size_mod
    total = base + mod_dex + mod_size
  end

  def ac_flatfooted
    base = 10
    mod_armor  = self.ac_armor
    mod_shield = self.ac_shield
    mod_size   = self.size_mod
    total = base + mod_armor + mod_shield + mod_size
  end

  def initiative_total
    mod_dex  = self.dexterity_mod
    mod_misc = self.initiative_mod
    total = mod_dex + mod_misc
  end

  def money_total
    cp = self.money_cp
    sp = self.money_sp
    gp = self.money_gp
    pp = self.money_pp
    total = (cp/100) + (sp/10) + gp + (pp*5)
  end 


  def fortitude
    level      = self.level
    class_type = self.class_type
    sql = "select fort_save from class_tables where upper(name) = upper('"+class_type+"') and level = "+level.to_s+" LIMIT 1"
    total = ClassTable.find_by_sql(sql)
    total[0].fort_save.to_i
  end

  def reflex
    level      = self.level
    class_type = self.class_type
    sql = "select ref_save from class_tables where upper(name) = upper('"+class_type+"') and level = "+level.to_s+" LIMIT 1"
    total = ClassTable.find_by_sql(sql)
    total[0].ref_save.to_i
  end

  def will
    level      = self.level
    class_type = self.class_type
    sql = "select will_save from class_tables where upper(name) = upper('"+class_type+"') and level = "+level.to_s+" LIMIT 1"
    total = ClassTable.find_by_sql(sql)
    total[0].will_save.to_i
  end

  def fortitude_total
    base        = self.fortitude
    mod_ability = self.constitution_mod
    mod_misc    = self.fortitude_mod
    total = base + mod_ability + mod_misc
  end

  def reflex_total
    base        = self.reflex
    mod_ability = self.dexterity_mod
    mod_misc    = self.reflex_mod
    total = base + mod_ability + mod_misc
  end

  def will_total
    base        = self.will
    mod_ability = self.wisdom_mod
    mod_misc    = self.will_mod
    total = base + mod_ability + mod_misc
  end
  
  def strength_mod
    ability_score = self.strength
    sql = "select `mod` from ability_mods where id = #{ability_score} LIMIT 1"
    total = AbilityMod.find_by_sql(sql)
    total[0].mod.to_i
  end

  def dexterity_mod
    ability_score = self.dexterity
    sql = "select `mod` from ability_mods where id = #{ability_score} LIMIT 1"
    total = AbilityMod.find_by_sql(sql)
    total[0].mod.to_i
  end

  def constitution_mod
    ability_score = self.constitution
    sql = "select `mod` from ability_mods where id = #{ability_score} LIMIT 1"
    total = AbilityMod.find_by_sql(sql)
    total[0].mod.to_i
  end

  def intelligence_mod
    ability_score = self.intelligence
    sql = "select `mod` from ability_mods where id = #{ability_score} LIMIT 1"
    total = AbilityMod.find_by_sql(sql)
    total[0].mod.to_i
  end

  def wisdom_mod
    ability_score = self.wisdom
    sql = "select `mod` from ability_mods where id = #{ability_score} LIMIT 1"
    total = AbilityMod.find_by_sql(sql)
    total[0].mod.to_i
  end

  def charisma_mod
    ability_score = self.charisma
    sql = "select `mod` from ability_mods where id = #{ability_score} LIMIT 1"
    total = AbilityMod.find_by_sql(sql)
    total[0].mod.to_i
  end

  def level
    xp =  self.xp
    sql = "select id from levels where xp <= #{xp} order by id desc LIMIT 1"
    total = Level.find_by_sql(sql)
    total[0].id
  end

  def xp_levelup
    level = self.level+1
    sql = "select `xp` from levels where id = #{level} LIMIT 1"
    total = Level.find_by_sql(sql)
    total[0].xp.to_i
  end

end