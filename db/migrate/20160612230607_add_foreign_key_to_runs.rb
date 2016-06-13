class AddForeignKeyToRuns < ActiveRecord::Migration
  def change
    add_foreign_key :runs, :users
  end
end
