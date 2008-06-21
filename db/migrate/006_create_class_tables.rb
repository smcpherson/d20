class CreateClassTables < ActiveRecord::Migration
  def self.up
    create_table :class_tables do |t|
    end
  end

  def self.down
    drop_table :class_tables
  end
end
