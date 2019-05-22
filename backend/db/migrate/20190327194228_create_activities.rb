class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :place
      t.datetime :begins_at
      t.integer :duration
      t.text :description
      t.references :creator, foreign_key: { to_table: :users}
      t.integer :max_participants

      t.timestamps
    end
  end
end
