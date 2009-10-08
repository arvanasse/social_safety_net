class CreateManagedCases < ActiveRecord::Migration
  def self.up
    create_table :managed_cases do |t|
      t.references :cost_center
      t.references :parent
      t.string :state
      t.string :title
      t.string :reference
      t.date :opened_on
      t.date :closed_on

      t.timestamps
    end

    add_index :managed_cases, [:cost_center_id, :state]
    add_index :managed_cases, [:cost_center_id, :title]
    add_index :managed_cases, [:cost_center_id, :reference]
    add_index :managed_cases, :parent_id
  end

  def self.down
    drop_table :managed_cases
  end
end
