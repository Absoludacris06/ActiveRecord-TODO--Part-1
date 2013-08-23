require_relative 'config/application'

puts "Put your application code in #{File.expand_path(__FILE__)}"

class Controller
ARGV

case ARGV[0] 
  when "list"
    View.format_list(Task.all)
  when "delete"
    task_array = Task.all
    puts "Deleted: #{task_array[ARGV[1]-1][:description]}"
    Task.find(task_array[ARGV[1] - 1][:id]).destroy
  when "add" 

end

class View

  def self.format_list(task_array)
    task_array.each_with_index do |element, index|
    puts "#{index + 1}. [#{if element[:completed] ? 'X' : ' '}] #{element[:description]}"
  end




end
