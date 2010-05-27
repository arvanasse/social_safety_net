class CreateCaseParticipants < ActiveRecord::Migration
  def self.up
    create_table :case_participants do |t|
      t.references :managed_case
      t.references :participant, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :case_participants
  end
end
