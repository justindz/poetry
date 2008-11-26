class CreateUrls < ActiveRecord::Migration
  def self.up
    create_table :urls do |t|
      t.column :user_id, :integer
      t.column :url, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :urls
  end
end
