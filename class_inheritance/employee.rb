class Employee
  attr_reader :salary
  
  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary = name, title, salary
    @boss = boss
    
    if boss
      boss.managed_employees << self 
    end  
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :managed_employees
  
  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss)
    @managed_employees = []
  end
  
  def bonus(multiplier)
    total_subs_salary * multiplier
  end
  
  def total_subs_salary
    total = 0
    @managed_employees.each do |employee|
      if employee.is_a?(Manager)
        total += employee.salary
        total += employee.total_subs_salary
      else
        total += employee.salary
      end
    end
    total
  end
end

if __FILE__ == $PROGRAM_NAME

  ned = Manager.new("Ned", "Founder", 1000000)
  darren = Manager.new("Darren", "TA Manager", 78000, ned)
  shawna = Employee.new("Shawna", "TA", 12000, darren)
  david = Employee.new("David", "TA", 10000, darren)
  
  p ned.bonus(5)
  p darren.bonus(4)
  p david.bonus(3)
  
end