require 'faker'
require 'csv'

class TaskGenerator

  def self.create_fake_task_data
    fake_data = []
    data_file_path = APP_ROOT.join('db', 'fake_tasks.csv')
    20.times { fake_data << [Faker::Company.bs, rand(0..1).to_s] }
    CSV.open(data_file_path, "w+") do |csv|
    	csv << ["description", "completed"]
      fake_data.each { |row| csv << row }
    end
    data_file_path
  end

end
