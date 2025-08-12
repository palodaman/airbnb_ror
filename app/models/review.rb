class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property, counter_cache: true
  
  validates :feedback, presence: true
  validates :cleanliness_rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}, presence: true
  validates :accuracy_rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}, presence: true
  validates :checkin_rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}, presence: true
  validates :communication_rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}, presence: true
  validates :location_rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}, presence: true
  validates :value_rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}, presence: true

  after_commit :update_final_rating, on: [:create, :update] #function to update on create and update of reviews

  def update_final_rating
    total_rating = cleanliness_rating + 
      accuracy_rating + 
      checkin_rating + 
      communication_rating + 
      location_rating + 
      value_rating

    update_column(:final_rating, total_rating.to_f / 6 ) #to_f for decimal
    property.update_average_rating
  end

end
