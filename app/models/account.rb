class Account < ActiveRecord::Base
  has_many  :users

  validates_presence_of :name, :host

  state_machine :initial=>:active do
    state :active
    state :suspended

    event :reactivate do
      transition :suspended => :active
    end

    event :suspend do
      transition all => :suspended
    end
  end

  state_machine :billing_status, :initial=>:current do
    state :current
    state :past_due_30_days
    state :past_due_60_days

    after_transition any=>:past_due_60_days do |acct, trans|
      acct.suspend!
    end

    after_transition :past_due_60_days => :current do |acct, trans|
      acct.reactivate! if acct.suspended?
    end

    event :paid_in_full do
      transition all => :current
    end

    event :mark_not_paid do
      transition :current => :past_due_30_days
      transition :past_due_30_days => :past_due_60_days
    end
  end
end
