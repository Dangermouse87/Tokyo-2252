require_relative '../models/order' # required as we are going to create orders
require_relative '../views/orders_view' # require VIEW as we are asking to the VIEW to display data
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/sessions_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository # create instance variable so it can be used around the class
    @orders_view = OrdersView.new
    @sessions_view = SessionsView.new
    @customers_view = CustomersView.new
    @meals_view = MealsView.new
  end

  def add
    meal = select_meal
    customer = select_customer
    employee = select_employee
    @order_repository.create(Order.new(meal: meal, customer: customer, employee: employee))
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display(orders)
  end

  def list_my_orders(current_user)
    list_my_undelivered_orders(current_user)
  end

  def mark_as_delivered(current_user)
    list_my_undelivered_orders(current_user)
    order_id = @orders_view.ask_user_for_index
    my_order = @order_repository.my_undelivered_orders(current_user)
    order = my_order[order_id]
    @order_repository.mark_as_delivered(order)
    @save
  end

  def list
    @orders_view.display(@order_repository.all) # retrieves data from REPO and asks the VIEW to display retrieved data!
  end

  def list_my_undelivered_orders(user)
    orders = @order_repository.my_undelivered_orders(user)
    @orders_view.display(orders)
  end

  private

  def select_meal
    meals = @meal_repository.all
    @meals_view.display_list(meals)
    index = @meals_view.ask_for("meal").to_i
    return meals[index - 1]
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display_list(customers)
    index = @customers_view.ask_for("customer").to_i
    return customers[index - 1]
  end

  def select_employee
    employees = @employee_repository.all_riders
    @sessions_view.display_list(employees)
    index = @sessions_view.ask_for("employee").to_i
    return employees[index - 1]
  end
end
