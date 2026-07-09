class CreateParks < ActiveRecord::Migration[8.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :banner_url

      t.timestamps
    end
  end
end
