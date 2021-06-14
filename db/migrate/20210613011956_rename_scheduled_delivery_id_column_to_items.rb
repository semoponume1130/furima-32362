class RenameScheduledDeliveryIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :day_id, :scheduled_delivery_id
  end
end
