module Addressed
  module InstanceMethods
    def self.included(base)
      require 'net/http'
      base.geocoded_by :full_address, :latitude => :lat, :longitude => :lng
      base.before_validation :geocode_address
    end

    def full_address(separator = ', ')
      csz = "#{self.city}, #{self.state} #{self.zip_code}"
      csz = "#{csz}-#{self.zip4}" unless self.zip4.blank?
      [self.street.gsub("\n", separator), csz].join separator
    end

    private
      def geocode_address
        fetch_coordinates if new_record? || dirty_address?
      end

      def dirty_address?
        self.street_changed? || self.city_changed? || self.state_changed?
      end
  end
end
