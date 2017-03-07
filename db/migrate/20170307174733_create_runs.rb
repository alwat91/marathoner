class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.float :mileage
      t.datetime :beginning_time
      t.datetime :end_time
      t.time :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
