require 'csv'
require_relative '../config/application'
require_relative '../app/models/task'


#######This file will be located inside of library folder########

class TodoImporter

  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      return_values = row.to_hash.select { |k, v| Task.column_names.include?(k) } #linked with the class Lists class which is created under lists.rb(models)
      # puts "imported #{return_values["firstname"]}"
      
      task = Task.new(return_values)
      task.save!
    end
  end
end

# p TodoImporter.import('../db/data/list.csv') # this will let us run importer--