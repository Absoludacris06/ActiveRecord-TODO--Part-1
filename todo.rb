require_relative 'config/application'

module Controller

  @command = ARGV.shift
  @task_item = ARGV.join(" ")

  def self.input

    case @command
    when "list"
      View.format_list(Task.all)
    when "delete"
      task_array = Task.all
      puts "Deleted: #{task_array[@task_item.to_i - 1][:description]}"
      Task.delete(task_array[(@task_item.to_i) - 1 ][:id])
    when "add"
      Task.create(description: @task_item)
    when "completed"
      task_array = Task.all
      puts "Completed: #{task_array[@task_item.to_i - 1][:description]}"
      Task.update(task_array[(@task_item.to_i) - 1 ][:id], :completed => true)
    else
      "This command is incorrect."
    end
  end

  class View

    def self.format_list(task_array)
      task_array.each_with_index do |element, index|
        puts "#{index + 1}. [#{'X' if element[:completed]}] #{element[:description]}"
      end

    end
  end
end


Controller.input
