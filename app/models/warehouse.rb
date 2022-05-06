class Warehouse < ApplicationRecord
  validates :name, :code, :cep, :address, :area, :description, :city, presence: true
  validates :name, :code, uniqueness: true
  validates :cep, format: { with: /\d{5}-\d{3}/ }
end
