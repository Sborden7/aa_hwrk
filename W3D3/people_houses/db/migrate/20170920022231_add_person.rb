class AddPeopleTables < ActiveRecord::Migration[5.1]

  def change
    create_table :people do |pe|
      pe.string :name
      pe.integer :house_id

      pe.timestamps
    end
    add_index :people, :house_id
  end
end
