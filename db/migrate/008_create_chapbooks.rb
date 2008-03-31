class CreateChapbooks < ActiveRecord::Migration
  def self.up
    create_table :chapbooks do |t|
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :title
      t.text :introduction

      t.timestamps
    end
    
    create_table :chapbooks_poems, :id => false, :force => true do |t|
      t.integer :chapbook_id
      t.integer :poem_id
      t.datetime :created_at
 
      t.timestamps
    end
  end

  def self.down
    drop_table :chapbooks
    drop_table :chapbooks_poems
  end
end
