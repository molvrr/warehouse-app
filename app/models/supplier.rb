class Supplier < ApplicationRecord
  validates :trade_name, :corporate_name, :full_address, :city, :state, :email,
            :phone_number, :registration_number, presence: true
  validates :registration_number, format: { with: /\A\d\d\.\d{3}\.\d{3}\/\d{4}-\d\d\z/ }
  validates :registration_number, uniqueness: true
end
