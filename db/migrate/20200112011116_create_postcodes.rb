# frozen_string_literal: true

class CreatePostcodes < ActiveRecord::Migration[6.0]
  def change
    create_table :postcodes do |t|
      t.string :value, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
