class Order < ApplicationRecord
  COUNTRY = "Brazil"
  belongs_to :user

  geocoded_by :full_address, latitude: :lat, longitude: :lng
  #after_validation :geocode, if: ->(obj){ obj.address_changed? or obj.city_changed? or obj.state_changed? }
  after_validation :geocode


  def full_address
    [address, number, city, state, COUNTRY].join(', ')
  end
end
