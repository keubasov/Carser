class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
      t.string :name
      t.string :synonym
      t.belongs_to :car_brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
