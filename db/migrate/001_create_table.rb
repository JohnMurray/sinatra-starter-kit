require 'active_record'

class CreateTable < ActiveRecord::Migration
  
  def self.up
    create_table :stuffs do |t|
      t.column :stuff_item, :string, :null => false
    end
  end

  def self.down
    drop_table :stuffs
  end

end
