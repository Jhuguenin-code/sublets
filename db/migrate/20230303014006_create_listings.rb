class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :street_address
      t.integer :unit_number
      t.string :city
      t.integer :zip_code
      t.text :info
      t.integer :bathrooms
      t.integer :bedrooms
      t.integer :current_rent
      t.integer :sublet_rent
      t.integer :poster
      t.string :image

      t.timestamps
    end
  end
end
