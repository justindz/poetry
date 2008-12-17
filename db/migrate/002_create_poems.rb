class CreatePoems < ActiveRecord::Migration
  def self.up
    create_table :poems do |t|
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :title
      t.text :body
      t.integer :views, :default => 0
      t.integer :license_id
      t.integer :original_id

      t.timestamps
    end
  end

  def self.down
    drop_table :poems
  end
end
