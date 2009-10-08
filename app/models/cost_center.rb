class CostCenter < ActiveRecord::Base
  belongs_to :account

  has_many   :managed_cases

  validates_presence_of :account, :name
  validates_numericality_of :account_id, :allow_nil=>true,
                            :greater_than => 0, :only_integer=>true,
                            :message => 'must be a valid reference'
end
