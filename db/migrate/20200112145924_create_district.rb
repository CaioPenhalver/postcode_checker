class CreateDistrict < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
