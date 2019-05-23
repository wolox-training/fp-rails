# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User
end
