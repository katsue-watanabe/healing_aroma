class Massage < ApplicationRecord
  belongs_to :reservation
  
  validates :aroma,  presence: true, length: { maximum: 50 }
  validates :menu,  presence: true, length: { maximum: 50 }
  validates :explantion,  presence: true, length: { maximum: 200 }
end
