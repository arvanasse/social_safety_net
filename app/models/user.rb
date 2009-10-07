class User < ActiveRecord::Base
  acts_as_authentic do |auth|
    auth.login_field = :email
  end

  belongs_to :account

  validates_presence_of     :account
  validates_numericality_of :account_id,
                            :only_integer=>true, :greater_than=>0, :allow_nil=>true,
                            :message => 'must be a valid reference' 

  state_machine :initial=>:pending do 
    state :pending
    state :active
    state :suspended
    state :deleted

    event :activate do
      transition all => :active
    end

    event :suspend do
      transition [:pending, :active] => :suspended
    end

    event :delete! do
      transition all => :deleted
    end
  end
  
  alias_method :purge, :destroy
  alias_method :destroy,  "delete!".to_sym 
end
