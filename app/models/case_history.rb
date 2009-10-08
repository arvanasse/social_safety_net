class CaseHistory < ActiveRecord::Base
  belongs_to :managed_case
  belongs_to :detail, :polymorphic => true

  validates_presence_of     :managed_case
  validates_numericality_of :managed_case_id, :parent_id, :detail_id,
                            :greater_than => 0, :only_integer => true, :allow_nil => true,
                            :message => 'must be a valid reference'

  state_machine :initial=>:pending do
    state :pending
    state :complete

    after_transition any=>:complete do |history, trans|
      history.update_attribute :completed_on, Date.today
    end

    event :complete do 
      transition all => :complete
    end
  end
end
