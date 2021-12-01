class FileAnalyzer
  def statistics(file_name)
    file = File.open(file_name)
    lines = file.readlines
    all_lines = lines.size
    empty_lines = 0
    line_with_y = 0
    lines.each do |line|
      empty_lines += 1  if  line == "\n"
      line_with_y += 1 if line.include?("y")
      end
    puts "Всего строк #{all_lines}, пустые #{empty_lines}, строки с 'y' #{line_with_y} "
  end

  def read_file(file_name)
    file = File.open(file_name)
    file.readlines
  end

  def delete_file(file_name)
    begin
      File.delete(file_name)
    rescue StandardError => e
      puts e.message
    end
  end

  def edit_file(file_name, text)
    begin
      File.open(file_name, 'w') do |file|
        file.write(text)
      end
    rescue StandardError => e
      puts e.message
    end
  end

    def create_write_file(file_name, text)
      begin
        File.open(file_name, 'a') do |file|
        file.write(text)
      end
      rescue ArgumentError => e
        puts "ArgumentError #{e.message}"
      rescue Exception => e
        puts "Exception #{e.message}"
        end
    end

  def rename_file(file_name, new_file_name)
    begin
    File.rename(file_name, new_file_name)
    rescue StandardError => e
      puts e.message
    end
  end
end





