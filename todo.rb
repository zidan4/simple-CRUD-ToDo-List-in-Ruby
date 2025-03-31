tasks = []

def show_tasks(tasks)
  puts "\n📋 Your To-Do List:"
  if tasks.empty?
    puts "No tasks yet!"
  else
    tasks.each_with_index do |task, index|
      status = task[:done] ? "[✔]" : "[ ]"
      puts "#{index + 1}. #{status} #{task[:title]}"
    end
  end
end

loop do
  puts "\n1. Add Task"
  puts "2. View Tasks"
  puts "3. Mark Task as Done"
  puts "4. Delete Task"
  puts "5. Exit"
  print "Choose an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter task name: "
    title = gets.chomp
    tasks << { title: title, done: false }
    puts "Task added!"
  when 2
    show_tasks(tasks)
  when 3
    show_tasks(tasks)
    print "Enter task number to mark as done: "
    index = gets.chomp.to_i - 1
    tasks[index][:done] = true if index.between?(0, tasks.length - 1)
  when 4
    show_tasks(tasks)
    print "Enter task number to delete: "
    index = gets.chomp.to_i - 1
    tasks.delete_at(index) if index.between?(0, tasks.length - 1)
    puts "Task deleted!"
  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid option! Try again."
  end
end
