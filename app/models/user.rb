# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :listings, foreign_key: "landlord_id", class_name: "Listing"

  enum role: [:registered, :subscriber]
end
