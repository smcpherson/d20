class CreateLevels < ActiveRecord::Migration
  def self.up
    create_table :levels do |t|
    end
  end

  def self.down
    drop_table :levels
  end
end
