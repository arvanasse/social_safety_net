class CreateCostCenters < ActiveRecord::Migration
  def self.up
    create_table :cost_centers do |t|
      t.references :account
      t.string :type
      t.string :name

      t.timestamps
    end

    add_index :cost_centers, [:account_id, :name]
  end

  def self.down
    drop_table :cost_centers
  end
end
