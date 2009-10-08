class ManagedCase < ActiveRecord::Base
  belongs_to :cost_center

  has_many :case_histories

  validates_presence_of :cost_center, :title
  validates_numericality_of :cost_center_id, :allow_nil=>true,
                            :greater_than => 0, :only_integer=>true,
                            :message => 'must be a valid reference'

  state_machine :initial=>:pending do
    state :pending
  end
end
