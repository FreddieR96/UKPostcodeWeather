class CreateTemperatureThresholds < ActiveRecord::Migration[6.1]
  def change
    create_table :temperature_thresholds do |t|
      t.float :warm_temperature
      t.float :hot_temperature

      t.timestamps
    end
  end
end
