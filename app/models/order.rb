class Order < ApplicationRecord
  COUNTRY = "Brazil"
  belongs_to :user

  geocoded_by :full_address, latitude: :lat, longitude: :lng
  after_validation :geocode, if: ->(o){ o.address_changed? or obj.city_changed? or obj.state_changed? }

  def full_address
    [address, number, city, state, COUNTRY].join(', ')
  end

  def to_s
    self.id.to_s + " (" + state + ")"
  end
end
