class CreateLocations < ActiveRecord::Migration[5.1]
	def change
		create_table :locations do |t|
			t.string :city
			t.string :address
			t.string :hash_id ,unique: true, null: false
			t.timestamps
		end
		add_index :locations, [:city, :address, :hash_id], :unique => true
	end
end
