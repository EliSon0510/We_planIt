class AddColumnsToInteractions < ActiveRecord::Migration[6.0]
  def change

    add_column :interactions, :validation, :boolean
    add_column :interactions, :user_id, :integer
    add_column :interactions, :trip_id, :integer
  end
end
