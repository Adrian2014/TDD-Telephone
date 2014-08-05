class Pizza
  attr_accessor :name, :description, :time_baked, :toppings

  def initialize(arg)
    @name = arg
    @description = " "
    @time_baked = 0
    @toppings = []
  end

  def require_bake_time
    max = @toppings.map(&:required_bake_time).max
    return max + 900
  end

  def bake(time)
    @time_baked += time
    @toppings.each do |topping|
      topping.bake(time)
    end
  end

  def baked?
   @time_baked >= require_bake_time
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

end

