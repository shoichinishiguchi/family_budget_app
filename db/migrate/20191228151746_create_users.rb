class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.belongs_to :family

      t.timestamps
      t.index :email, unique: true
    end
  end
end
