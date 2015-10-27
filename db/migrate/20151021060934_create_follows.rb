class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, index: true
      t.string :artist_id

      t.timestamps
    end
  end
end
