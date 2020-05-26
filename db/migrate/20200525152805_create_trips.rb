class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.integer :budget
      t.string :interests
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
