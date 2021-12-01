class Business
  @@workers_by_business = []

  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def self.amount_of_workers
    statistic = {}
    @@workers_by_business.each do |worker|
      name_of_business = worker[:specialization]
      if statistic.has_key?(name_of_business)
        statistic[name_of_business] += 1
      else
        statistic[name_of_business] = 1
      end
  end
   statistic
  end


  def self.show_workers
    @@workers_by_business.each {|worker| puts worker}
  end

end


class WorkerAccountant < Business
  FIX_SALARY = 2000
  def initialize(name, surname, experience)
    super(name, surname)
    @experience = experience
    @@workers_by_business << { name: name, surname: surname, specialization: 'Accountant', salary: @experience * FIX_SALARY }
  end

  def get_salary
   return @experience * FIX_SALARY
  end
end

 class WorkerLawyer < Business
   FIX_SALARY = 3000
   
   def initialize(name, surname, experience)
     super(name, surname)
     @experience = experience
     @@workers_by_business << { name: name, surname: surname, specialization: 'Lawyer', salary: @experience * FIX_SALARY }
   end

   def get_salary
     return @experience * FIX_SALARY
   end
 end
