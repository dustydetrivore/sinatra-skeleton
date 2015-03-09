class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :backings do |t|
            t.references :project
        	t.references :user
        end
        change_table :reviews do |t|
        	t.references :project
        	t.references :user
        end
        change_table :projects do |t|
        	t.references :creator
        end
    end
end

# class User < AR::Base
#   has_many :backings
#   has_many :projects, through: :backings

