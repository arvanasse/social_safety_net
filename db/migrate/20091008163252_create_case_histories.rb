class CreateCaseHistories < ActiveRecord::Migration
  def self.up
    create_table :case_histories do |t|
      t.references :managed_case
      t.references :parent
      t.string :state
      t.date :added_on
      t.date :due_on
      t.date :completed_on
      t.references :detail, :polymorphic=>true

      t.timestamps
    end

    add_index :case_histories, :managed_case_id
    add_index :case_histories, [:managed_case_id, :state]
    add_index :case_histories, [:managed_case_id, :due_on]
    add_index :case_histories, [:managed_case_id, :detail_type]
  end

  def self.down
    drop_table :case_histories
  end
end
