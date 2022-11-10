require './underscore'
require './food'
require './animals'
require './prime_finder'

tom = Cat.new({ 
  sound: 'meow', 
  food_preference: {
    likes: [CatFood, Chicken, Milk],
    dislikes: [DogFood, HumanFood] 
  }
})

rex = Dog.new({ 
  sound: 'bark', 
  food_preference: {
    likes: [DogFood, CatFood, Chicken, HumanFood],
    dislikes: [Milk] 
  }
})

# Created an extra animal to show how flexible the animals class can be
rocky = Raccoon.new

puts "Running animal and food classes.."
food_choices = [Chicken.new, CatFood.new, DogFood.new, HumanFood.new, Lemon.new]
food_choices.each do |food|
  tom.eats food
  rex.eats food
  rocky.eats food
end

sleep 1

puts "\nNow running prime number finder...\n\n"
PrimeNumberFinder.new(5)
PrimeNumberFinder.new(0.005, true)
