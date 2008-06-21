class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
    end
  end

  def self.down
    drop_table :characters
  end
end
