class ManagedCase < ActiveRecord::Base
  belongs_to :agency

  has_many :case_histories

  has_many :case_participants
  has_many :participants, :through => :case_participants, :source => :participant

  validates_presence_of :agency, :title
  validates_numericality_of :agency_id, :allow_nil=>true,
                            :greater_than => 0, :only_integer=>true,
                            :message => 'must be a valid reference'

  state_machine :initial=>:pending do
    state :pending
  end
end
