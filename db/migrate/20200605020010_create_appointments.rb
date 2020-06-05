class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :month
      t.integer :day

      t.timestamps
    end
  end
end
