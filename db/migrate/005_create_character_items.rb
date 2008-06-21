class CreateCharacterItems < ActiveRecord::Migration
  def self.up
    create_table :character_items do |t|
    end
  end

  def self.down
    drop_table :character_items
  end
end
