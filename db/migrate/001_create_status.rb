class CreateStatus < ActiveRecord::Migration
  def up
    create_table :statuses do |t|
      t.string :status, null: false
      t.datetime :created_at
    end
  end

  def down
    drop_table :statuses
  end
end
