class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :role
      t.string :cedula
      t.string :name
      t.string :lastname
      t.string :phone

      t.timestamps
    end
  end
end
