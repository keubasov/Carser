class CarBrand < ActiveRecord::Base

  has_many :car_models, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {in: 3..20}
  validates :synonym, length: {in: 3..20}
  validates :synonym, uniqueness: true

end
