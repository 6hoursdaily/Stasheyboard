class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :message
      t.integer :service_id

      t.timestamps
    end
  end
end
