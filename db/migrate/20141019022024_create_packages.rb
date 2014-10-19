class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :sender_agency_id
      t.integer :receiver_agency_id
      t.string :status
      t.datetime :dispatched_at
      t.datetime :delivered_at
      t.decimal :lenght
      t.decimal :width
      t.decimal :height
      t.decimal :weight
      t.decimal :value

      t.timestamps
    end
  end
end
