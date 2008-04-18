class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :chapbook_id
      t.integer :poem_id
      t.integer :sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
