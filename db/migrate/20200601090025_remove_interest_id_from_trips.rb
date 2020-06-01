class RemoveInterestIdFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :interest_id, :integer
  end
end
