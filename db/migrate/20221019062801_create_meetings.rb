class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :topic
      t.datetime :start_time
      t.datetime :end_time
      t.time :duration
      t.string :host_name
      t.integer :limit

      t.timestamps
    end
  end
end
