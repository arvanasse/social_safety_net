class Account < ActiveRecord::Base
  has_many  :users

  validates_presence_of :name, :host

  state_machine :initial=>:active do
    state :active
    state :suspended

    event :suspend do
      transition all => :suspended
    end
  end

  state_machine :billing_status, :initial=>:current do
    state :current
    state :past_due_30_days
    state :past_due_60_days

    event :paid_in_full do
      transition all => :current
    end

    event :mark_not_paid do
      transition :current => :past_due_30_days
      transition :past_due_30_days => :past_due_60_days
    end
  end
end
