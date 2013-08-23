require_relative '../../config/application.rb'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :completed
    end
  end
end