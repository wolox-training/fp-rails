class Rent < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :book, optional: true
  
  validates :start_date, :end_date, :user_id, :book_id, presence: true
end
