class CreateTripsInterestsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :trips, :interests
  end
end
