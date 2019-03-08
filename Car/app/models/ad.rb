class Ad < ActiveRecord::Base
  belongs_to :car_model
  belongs_to :region
  validates :date, :price, :year, :car_brand, :car_model, :site_id, :link, :region_id, presence: true
  validates :site_id, uniqueness: true
  validates :price, inclusion: {in: 10000 .. 10000000}
  validates :year, inclusion: {in: 1980 .. Time.now.year}
  validates :make, length: {in: 3 .. 20}
validates :model, length: {in: 3 .. 20}
end