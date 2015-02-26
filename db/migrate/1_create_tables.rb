class CreateTables < ActiveRecord::Migration

	def change
		create_table :users do |t|
			t.string :username
			t.string :email
			t.string :password
			t.timestamps
		end

		create_table :projects do |t|
			t.string :name
			t.string :creator
			t.string :category
			t.integer :funding_goal
			t.integer :funding_pledged
			t.integer :rating
			t.timestamps
		end

		create_table :creators do |t|
			t.string :name
			t.string :location
			t.string :description
			t.timestamps
		end

		create_table :reviews do |t|
			t.string :user
			t.string :project
			t.integer :rating
			t.string :comments
			t.timestamps
		end

		create_table :backings do |t|
			t.string :user
			t.string :project
			t.integer :amount
			t.string :reward
		end

	end

end