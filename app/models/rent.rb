class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :start_date, :end_date, :user_id, :book_id, presence: true
end
