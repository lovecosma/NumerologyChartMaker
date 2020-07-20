class AddUserIdToNumerologyCharts < ActiveRecord::Migration
  def change
    add_column :numerology_charts, :user_id, :integer
  end
end
