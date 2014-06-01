class CreateRaterRates < ActiveRecord::Migration
  def change
    create_table :rater_rates do |t|
      t.integer :value

      t.timestamps
    end
  end
end
