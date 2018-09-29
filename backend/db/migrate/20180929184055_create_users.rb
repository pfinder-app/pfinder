class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :scoutname
      t.date :birthdate
      t.string :scoutgroup
      t.integer :canton

      t.timestamps
    end
  end
end
