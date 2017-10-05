# frozen_string_literal: true

class Shipper < ApplicationRecord
  has_one :address, as: :addressable
  has_one :contact, as: :contactable
  has_many :orders
end
