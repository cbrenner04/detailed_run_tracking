class AddDurationToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :duration, :integer
  end
end
