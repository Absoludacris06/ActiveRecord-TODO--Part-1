require_relative 'config/application'

class Controller

  @command = ARGV.shift
  @task_item = ARGV.join(" ")

  def self.input
    case @command
    when "list"
      View.format_list(Task.all)
    when "delete"
      puts "Deleted: #{specific_task[:description]}"
      Task.delete(specific_task[:id])
    when "add"
      task = Task.new(description: @task_item)
      if task.valid?
        task.save
        puts "Added: #{specific_task[:description]}"
      else
        puts "Something went wrong"
        puts task.full_messages
      end
    when "completed"
      puts "Completed: #{specific_task[:description]}"
      Task.update(specific_task[:id], :completed => true)
    else
      p "This command is incorrect."
    end
  end

  def self.specific_task
    task_array = Task.all
    task_array[@task_item.to_i - 1]
  end
end

class View
    def self.format_list(task_array)
      task_array.each_with_index do |element, index|
        puts "#{index + 1}. [#{'X' if element[:completed]}] #{element[:description]}"
      end
    end
end



Controller.input
