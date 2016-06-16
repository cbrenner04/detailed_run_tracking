class RemoveTimeFromRuns < ActiveRecord::Migration
  def change
    remove_column :runs, :time, :string

    change_column_null :runs, :duration, false
  end
end
