require "csv"

class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @orders_csv_path = orders_csv_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(orders_csv_path)
  end

  def create(order)
    @orders.empty? ? order.id = 1 : order.id = @orders.last.id + 1
    @orders << order
    @next_id += 1
    save_csv
  end

  def all
    @orders
  end

  def find(id)
    @orders.find { |order| order.id == id.to_i }
  end

  def undelivered_orders
    @orders.reject do |order|
      order.delivered?
    end
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  def my_undelivered_orders(employee)
    @orders.select { |order| order.employee == employee && !order.delivered? }
  end

  private

  def load_csv
    # iterate through all orders in the csv
    CSV.foreach(@orders_csv_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i # convert the string id to integer
      row[:delivered] = row[:delivered] == "true" # comparison to check if delivered is true
      row[:meal] = @meal_repository.find(row[:meal_id].to_i) # find the **meal instance** from meal repo
      row[:customer] = @customer_repository.find(row[:customer_id].to_i) # find **customer instance** from customer repo
      row[:employee] = @employee_repository.find(row[:employee_id].to_i) # find **employee instance** from customer repo
      @orders << Order.new(row) # add the new Order to the orders
    end
    @next_id = @orders.last.id + 1 unless @orders.empty? # increment orders
  end

  def save_csv
    # open csv
    CSV.open(@orders_csv_path, "wb") do |csv|
      csv << ["id", "delivered", "meal_id", "customer_id", "employee_id"] # add the headers
      # iterate over the instances of order to save them
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
