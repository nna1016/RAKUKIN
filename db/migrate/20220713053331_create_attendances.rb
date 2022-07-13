class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :updater
      t.datetime :in
      t.datetime :out
      t.integer :benefit
      t.string :updater
      t.timestamps
    end
  end
end
