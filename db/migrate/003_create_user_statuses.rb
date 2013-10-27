class CreateUserStatuses < ActiveRecord::Migration
  def up
    create_table :user_statuses do |t|
      t.integer :user_id, null: false
      t.integer :status_id, null: false
    end
  end

  def down
    drop_table :user_statuses
  end
end
