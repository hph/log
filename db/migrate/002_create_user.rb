class CreateUser < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name, null: false
    end
  end

  def down
    drop_table :users
  end
end
