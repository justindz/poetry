class CreateRevisions < ActiveRecord::Migration
  def self.up
    create_table :revisions do |t|
      t.integer :poem_id
      t.datetime :created_at
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :revisions
  end
end
