# frozen_string_literal: true

class AddRenterIdToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :tenant, foreign_key: { to_table: :users }
  end
end
