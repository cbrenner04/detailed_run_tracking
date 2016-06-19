class AddColumnsToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :type_of_workout, :string
    add_column :runs, :environment, :string
    add_column :runs, :surface, :string
    add_column :runs, :temperature, :integer
    add_column :runs, :how_it_went, :text
    add_column :runs, :last_meal, :text
    add_column :runs, :time_of_last_meal, :datetime
  end
end
