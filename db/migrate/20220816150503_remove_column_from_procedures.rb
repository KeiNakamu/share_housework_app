class RemoveColumnFromProcedures < ActiveRecord::Migration[6.0]
  def change
    remove_column :procedures, :date, :datetime
    remove_column :procedures, :deadline, :datetime
  end
end
