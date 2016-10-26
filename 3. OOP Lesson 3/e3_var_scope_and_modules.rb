module Swimmable

  # def initialize
  #   enable_swimming # this will initialize the 'instance var' @can_swim.
  # end

  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
puts teddy.swim
