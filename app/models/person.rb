class Person < ActiveRecord::Base
  has_many :case_participants, :as => :participant
  has_many :managed_cases, :through => :case_participants
  validates_presence_of :first_name, :last_name

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address(separator = ', ')
    csz = "#{self.city}, #{self.state} #{self.zip_code}"
    csz = "#{csz}-#{self.zip4}" unless self.zip4.blank?
    [self.street.gsub("\n", separator), csz].join separator
  end

  class << self
    def search( search_term )
      name_parts = if search_term.match ','
        search_term.split( /,\s*/, 2 ).reverse
      else
        search_term.split /\s+/, 2
      end

      name_parts.length == 2 ? 
        scoped(:conditions => { :first_name => name_parts.first, :last_name => name_parts.last }) :
        scoped(:conditions => { :last_name => name_parts.last })
    end
  end
end
