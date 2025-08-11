class Property < ApplicationRecord
    validates :name, presence: true
    validates :headline, presence: true
    validates :description, presence: true
    validates :address_1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true
    
    monetize :price_cents, allow_nil: true 

    has_many_attached :images

    has_many :reviews, dependent: :destroy #if a porpety is removed, all its reviews should also cascade csc 370
    #when the object is destroyed, destroy will be called on its associated objects.
end 
