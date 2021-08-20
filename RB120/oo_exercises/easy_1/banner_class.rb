# Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
  end

  def empty_line
  end

  def message_line
    "| #{@message} |"
  end
end

# Complete this class so that the test cases shown below work as intended. You are free to
# add any methods or instance variables you need. However, do not make the implementation
# details public. You may assume that the input will always fit in your terminal window.

# test cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+

# solution
class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @message.size}-+"
  end

  def empty_line
    "| #{' ' * @message.size} |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

# further exploration

class Banner
  def initialize(message, banner_width)
    @message = message
    @banner_width = banner_width
  end

  def to_s
    return "banner width is too long" if too_long
    return "banner width is too short" if too_short
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def too_long
    @banner_width > 80
  end
  
  def too_short
    @banner_width < @message.size
  end

  def horizontal_rule
    "+-#{'-' * @banner_width}-+"
  end

  def empty_line
    "| #{' ' * @banner_width} |"
  end

  def message_line
    "| #{@message.center(@banner_width)} |"
  end
end

# could also just slice the message so it fits into the banner width provided, see below

class Banner
  def initialize(message, banner_width)
    @message = message[0, banner_width]
    @banner_width = banner_width
  end
  # rest of code omitted for brevity
end
