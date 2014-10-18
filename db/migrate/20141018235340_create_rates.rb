class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :creator_id
      t.decimal :constant
      t.decimal :K_value

      t.timestamps
    end
  end
end
