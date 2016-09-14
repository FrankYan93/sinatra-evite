class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :person_id
      t.integer :event_id
      t.text :status

      t.timestamps
    end
  end
end
