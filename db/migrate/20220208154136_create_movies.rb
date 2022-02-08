class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :duration
      t.string :rating
      t.date :release_date

      t.timestamps
    end
  end
end
