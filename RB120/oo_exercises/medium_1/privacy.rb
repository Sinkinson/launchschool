# Consider the following class:

class Machine
  attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# Modify this class so both flip_switch and the setter method switch= are private methods.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private
  
  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

cpu = Machine.new

cpu.start
puts cpu.switch
cpu.stop
puts cpu.switch

# Futher exploration: add a private getter for @switch to the machine class, and add a method to Machine that shows how to use that getter

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def display_state
    "The switch is #{switch}"
  end

  private
  
  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

cpu = Machine.new

cpu.start
puts cpu.display_state
