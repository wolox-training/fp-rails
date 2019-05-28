class Book < ApplicationRecord
  has_many :rents, dependent: :nullify
  
  validates :genre, :author, :image, :title, :editor, :year, presence: true
end
