class Ticket < ApplicationRecord
  attr_accessor :ip_address

  belongs_to :order

  geocoded_by :ip_address, latitude: :lat, longitude: :lng

  after_validation :geocode, if: ->(o){ o.ip_address.present? }
  after_validation :is_suspicious

  def ip_address=(value)
    @ip_address= value
  end

  def ip_address
    @ip_address
  end

  private

  def is_suspicious
    if geocoded?
      self.suspicious = distance_from(order) > (ENV["SAFE_TICKET_DISTANCE"] || 100).to_i
      logger.warn("Suspicious ticket detected!") if self.suspicious
    else
      logger.warn("Ticket is not geocoded, skip security test")
    end
  end
end
