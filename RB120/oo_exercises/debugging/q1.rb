# On line 42 of our code, we intend to display information regarding the books currently checked in to our community
# library. Instead, an exception is raised. Determine what caused this error and fix the code so that the data is
# displayed as expected

class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end

  def display_data
    books.each do |book|
      book.display_data
    end
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

community_library.display_data

# solution

# There is no display_data method for for the books instance variable. We are trying to invoke the method on an Array object.
# The array class does not have a display_data method. We must invoke the method on each individual book to get the return
# we want. We can do this by iteratring through the books Array.

# We add this method to the Library class
def display_books
  books.each do |book|
    book.display_data
  end
end

# And we invoke the method like so
community_library.display_books
