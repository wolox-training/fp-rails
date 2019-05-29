class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :start_date, :end_date, :user, :book, presence: true
end
