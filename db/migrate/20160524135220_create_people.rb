class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :fullname
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps null: false
    end
  end
end
