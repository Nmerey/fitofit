class AddEndpointsToActivity < ActiveRecord::Migration[5.2]
  def change
  	add_column :activities, :start_point, :string
  	add_column :activities, :end_point, :string
  end
end
