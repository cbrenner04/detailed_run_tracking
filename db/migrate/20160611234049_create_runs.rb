class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.datetime :occurred_at, null: false
      t.float :distance, null: false
      t.integer :time, null: false

      t.timestamps null: false
    end
  end
end
