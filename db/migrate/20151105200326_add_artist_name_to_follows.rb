class AddArtistNameToFollows < ActiveRecord::Migration
  def change
    add_column :follows, :artist_name, :string
  end
end
