class Pizza
  attr_accessor :name, :description, :time_baked



  def self.create(arg)
    pizza=self.new
    pizza.name = arg
    pizza.description = " "
    pizza.time_baked = 0
    return pizza
  end



end


