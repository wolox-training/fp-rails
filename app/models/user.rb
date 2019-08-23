# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rents, dependent: :destroy
  validates :first_name, :last_name, :locale, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User
end
