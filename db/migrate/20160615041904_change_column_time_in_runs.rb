class ChangeColumnTimeInRuns < ActiveRecord::Migration
  def change
    change_column :runs, :time, :string
  end
end
