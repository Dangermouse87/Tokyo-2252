class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
    @current_user = nil
  end

  def run
    puts "🐈‍⬛ Welcome to Kiki's delivery service 🧙‍♀️"
    puts "           --           "

    while @running
      @current_user = @sessions_controller.login if @current_user.nil?
      @current_user.manager? ? manager_menu : rider_menu
    end
  end

  private

  def manager_menu
    print_manager_menu
    action = gets.chomp.to_i
    print `clear`
    route_manager_action(action)
  end

  def rider_menu
    print_rider_menu
    action = gets.chomp.to_i
    print `clear`
    route_rider_action(action)
  end

  def print_manager_menu
    puts "------- MENU -------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Add a new order"
    puts "6. List all the undelivered orders"
    puts "7. Logout"
    puts "8. Exit"
    print "> "
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then logout
    when 8 then stop
    else "Choose again"
    end
  end

  def print_rider_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Mark one of my orders as delivered"
    puts "2. List all my undelivered orders"
    puts "7. Logout"
    puts "8. Exit"
    print "> "
  end

  def route_rider_action(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@current_user)
    when 2 then @orders_controller.list_my_undelivered_orders(@current_user)
    when 7 then logout
    when 8 then stop
    end
  end

  def logout
    @current_user = nil
  end

  def stop
    logout
    @running = false
  end
end
