# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title 
  private attr_reader :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of? Todo
    todos << todo
  end

  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    (["---- #{title} ----"] + todos).join("\n")
  end

  def each
    todos.each { |todo| yield(todo) }
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  # takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  # returns new TodoList object containing only the done items
  def all_done
    complete = select { |todo| todo.done? }
    complete.title = "Complete"
    complete
  end

  # returns new TodoList object containing only the not done items
  def all_not_done
    not_complete = select { |todo| !todo.done? }
    not_complete.title = "Not complete"
    not_complete
  end

  # takes a string as argument, and marks the first Todo object that matches the argument as done.
  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end
  
  # 	mark every todo as done
  def mark_all_done
    each { |todo| todo.done! }
  end
  
  # mark every todo as not done
  def mark_all_undone
    each { |todo| todo.undone! }
  end
end
