class AddHousesTables < ActiveRecord::Migration[5.1]

  def change
    create_table :houses do |h|
      h.string :address

      h.timestamps
    end
  end
end
