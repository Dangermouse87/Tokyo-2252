class Order
  attr_reader :customer, :employee
  attr_accessor :meal, :id, :delivered

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered == true
  end

  def deliver!
    @delivered = true
  end
end
