class CreateRaterRates < ActiveRecord::Migration
  def change
    create_table :rater_rates do |t|
      t.integer :value
      t.integer :rateable_id
      t.string :rateable_type

      t.timestamps
    end
  end
end
