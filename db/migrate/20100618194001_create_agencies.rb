class CreateAgencies < ActiveRecord::Migration
  def self.up
    create_table :agencies do |t|
      t.references :account
      t.string :name
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :zip4
      t.float  :lat
      t.float  :lng


      t.timestamps
    end
  end

  def self.down
    drop_table :agencies
  end
end
