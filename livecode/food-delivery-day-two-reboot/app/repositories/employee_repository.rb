require "csv"
require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    load_csv if File.exist?(csv_file)
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  def all_riders
    riders = @employees.map { |employee| employee if employee.rider? }
    riders.compact
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end

  def save
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "username", "password", "role"]
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end
end
