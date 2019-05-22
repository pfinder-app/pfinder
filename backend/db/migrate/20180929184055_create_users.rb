class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :scoutname
      t.date :birthdate
      t.string :scoutgroup
      t.integer :canton
      t.string :token, index: true

      t.timestamps
    end
  end
end
