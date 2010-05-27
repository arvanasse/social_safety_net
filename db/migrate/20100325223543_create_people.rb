class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :born_on
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
    drop_table :people
  end
end
