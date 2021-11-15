class DataBase
  $storage = "New York Public Library"
  @@users = {}
  @@users_count = 0

  def print_global
    puts "Global variable is #$storage"
  end

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @@users_count += 1
  end

  def my_credentials
    puts "I'm #{@username} and my pass is #{@password}"
  end

    def how_many
      puts "There are users: #{@@users_count}"
    end
end


