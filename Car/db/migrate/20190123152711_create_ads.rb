class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.date :date
      t.integer :price
      t.integer :year
      t.belongs_to :car_model, index: true, foreign_key: true
      t.integer :site_id
      t.integer :site_name
      t.belongs_to :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
