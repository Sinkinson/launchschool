# Valentina is using a new task manager program she wrote. When interacting with her task manager,
# an error is raised that surprises her. Can you find the bug and fix it?

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    tasks = tasks.select do |task|
      task.priority == :high
    end

    display(tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks

# The reason the code above raises an error is because we are calling select on a local variable,
# that has yet to be assigned a value. Firstly, ruby has to decide if we are calling a setter method
# or initializing a local variable. We are initializing a local variable because if we were calling the
# setter method we would need to prepend self, like so: self.tasks =
# So therefore when we reference tasks again by calling select on it we are calling select on a variable
# that has nothing assigned to it instead of the getter method which we wanted to call. So the local variable
# is shadowing the getter method for tasks. We can get the intended behaviour by simply giving the local variable
# a different name.

def display_high_priority_tasks
  high_priority_tasks = tasks.select do |task|
    task.priority == :high
  end

  display(high_priority_tasks)
end

# Its also worth noting that we can see shadowing at work with the private display method. We have
# already made a call to the tasks getter method in display_all_tasks and passed this into display.
# Therefore in display the use of tasks is referencing the method parameter and not the getter method.
