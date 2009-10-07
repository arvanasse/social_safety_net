class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :host
      t.string :state
      t.string :billing_status
      t.date :bill_on

      t.timestamps
    end

    add_index :accounts, :host
    add_index :accounts, :bill_on
  end

  def self.down
    drop_table :accounts
  end
end
