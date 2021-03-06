class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.date :birth_date
      t.integer :height
      t.integer :weight

      t.timestamps null: false
    end
  end
end
