class RemoveInterestsTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :interests
  end
end
