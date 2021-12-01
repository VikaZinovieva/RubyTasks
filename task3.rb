class Library
  attr_accessor :author, :year, :name, :status

  @@id = 0
  @@list_of_books = []

  def initialize (author, year,  name, status)
    @author = author
    @year = year
    @name = name
    @status = status
    @@id += 1
    @@list_of_books << { author: author, year: year, name: name, status: status, id: @@id }
  end

   def self.sortId
     @@list_of_books.sort_by!{ |book| book[:id] }
  end

  def self.search_by(param, value)
    case param
    when :id
      @@list_of_books.find{ |book| book[:id] == value }
      when :name
      @@list_of_books.find{ |book| book[:name] == value }
    when :author
      @@list_of_books.find{ |book| book[:author] == value }
    else
      "I don't know what do you mean"
    end
  end
end

