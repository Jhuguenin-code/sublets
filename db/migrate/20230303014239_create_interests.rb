class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.integer :listing_id
      t.integer :user_id

      t.timestamps
    end
  end
end
