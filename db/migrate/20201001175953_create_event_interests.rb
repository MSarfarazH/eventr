class CreateEventInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :event_interests do |t|
      t.integer :event_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
