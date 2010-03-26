class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

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
