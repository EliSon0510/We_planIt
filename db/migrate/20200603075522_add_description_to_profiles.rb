class AddDescriptionToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :description, :text
  end
end
