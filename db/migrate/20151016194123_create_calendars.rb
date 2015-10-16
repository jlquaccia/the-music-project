class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :artist
      t.string :venue
      t.string :state
      t.string :city
      t.date :date
      t.time :time
      t.string :address

      t.timestamps
    end
  end
end