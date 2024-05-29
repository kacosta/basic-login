class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.date :birthdate, null: false
      t.integer :role, null: false, default: 0
      t.string :email, null: false
      t.string :password_digest, null: false
      t.datetime :confirmed_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
