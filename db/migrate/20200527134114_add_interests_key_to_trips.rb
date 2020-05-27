class AddInterestsKeyToTrips < ActiveRecord::Migration[6.0]
  def change
    add_reference :trips, :interest, index: true
  end
end
