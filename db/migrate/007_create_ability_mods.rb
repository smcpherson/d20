class CreateAbilityMods < ActiveRecord::Migration
  def self.up
    create_table :ability_mods do |t|
    end
  end

  def self.down
    drop_table :ability_mods
  end
end
