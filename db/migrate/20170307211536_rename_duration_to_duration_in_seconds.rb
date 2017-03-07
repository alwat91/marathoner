class RenameDurationToDurationInSeconds < ActiveRecord::Migration[5.0]
  def change
    remove_column :runs, :duration
    add_column :runs, :duration_in_secs, :float
  end
end
