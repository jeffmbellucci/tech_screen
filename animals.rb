class Animal
  attr_accessor :sound, :food_preference
  
  def initialize(options)
    options = {sound: "animal noise", food_preference: {likes: [HumanFood], dislikes: []}}.merge(options)
    @sound = options[:sound]
    @food_preference = options[:food_preference]
  end

  def makes_sound
    puts sound
  end

  def eats(food)
    puts "#{self.class.name} tries #{food.to_s}..."
    return if likes_food?(food).nil?
    likes_food?(food) ? 3.times { makes_sound } : makes_sound 
  end

  private

  def likes_food?(food)
    if food_preference[:likes].include?(food.class)
      return true
    elsif food_preference[:dislikes].include?(food.class)
      return false
    else
      unknown_food_error(food)
    end
  end

  def unknown_food_error(food)
    begin 
      raise "The #{self.class.name} doesn't know what #{food.to_s} is!"
    rescue RuntimeError => e
      puts e.message
    end
  end
end

class Cat < Animal; end
class Dog < Animal; end
class Raccoon < Animal; end
