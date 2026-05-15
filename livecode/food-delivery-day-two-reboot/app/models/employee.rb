class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @role = attributes[:role]
    @username = attributes[:username]
    @password = attributes[:password]
  end

  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end
end
