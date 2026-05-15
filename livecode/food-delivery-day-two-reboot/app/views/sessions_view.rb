class SessionsView
  def ask_for(thing)
    puts "#{thing.capitalize}?"
    gets.chomp
  end

  def signed_in
    puts "Logged In"
  end

  def wrong_credentials
    puts "Wrong credentials, try again."
  end

  def display_list(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1} - #{employee.username}"
    end
  end
end
