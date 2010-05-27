class CaseParticipant < ActiveRecord::Base
  belongs_to :managed_case
  belongs_to :participant, :polymorphic => true

  validates_presence_of :participant_id, :participant_type, :managed_case_id
end
