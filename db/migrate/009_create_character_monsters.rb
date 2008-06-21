class CreateCharacterMonsters < ActiveRecord::Migration
  def self.up
    create_table :character_monsters do |t|
    end
  end

  def self.down
    drop_table :character_monsters
  end
end
