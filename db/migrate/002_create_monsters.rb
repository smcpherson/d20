class CreateMonsters < ActiveRecord::Migration
  def self.up
    create_table :monsters do |t|
    end
  end

  def self.down
    drop_table :monsters
  end
end
