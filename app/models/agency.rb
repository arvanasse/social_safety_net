class Agency < ActiveRecord::Base
  require 'addressed'
  include Addressed::InstanceMethods

  belongs_to :account

  validates_presence_of :name

  class << self
    def search( search_term )
      find :all, :conditions => ['name like ?', "#{search_term}%"]
    end
  end
end
