class ChangeValidationInTableInteractions < ActiveRecord::Migration[6.0]
  def change
    change_column_default :interactions, :status, "active"
  end
end
