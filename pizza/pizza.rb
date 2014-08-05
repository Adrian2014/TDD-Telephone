class Pizza
  attr_accessor :name, :description, :time_baked, :toppings

  def initialize(name)
    @name = name
    @description = " "
    @time_baked = 0
    @toppings = []
  end

  def required_bake_time
    max = @toppings.map(&:required_bake_time).max
    return max + 900
  end

  def bake(time)
    @time_baked += time
    @toppings.each { |topping| topping.bake(time) }
  end

  def baked?
   @time_baked >= required_bake_time
  end

  def unfinished_toppings
    self.toppings.select{ |topping| !topping.baked? }
  end

  def finished_toppings
    self.toppings.select{ |topping| topping.baked? }
  end

end

class Topping
  attr_accessor :required_bake_time, :time_baked

  def initialize(args)
    @name = args[:name]
    @required_bake_time = args[:required_bake_time]
    @time_baked = 0
  end

  def bake(time)
    self.time_baked += time
  end

  def baked?
    @time_baked >= required_bake_time
  end

end

