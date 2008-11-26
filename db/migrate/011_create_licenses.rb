class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
      t.string :name
      t.text :embed

      t.timestamps
    end
  end

  def self.down
    drop_table :licenses
  end
end
