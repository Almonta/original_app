class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :customer, foreign_key: true
      t.string :serial_number
      t.date :line_on
      t.date :completed_on
      t.date :shipmented_on
      t.date :deliveried_on

      t.timestamps
    end
  end
end
