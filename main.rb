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

# Created an extra animal to show how flexible the animals class is
rocky = Raccoon.new(sound: "squeak", food_preference: {likes: [HumanFood], dislikes: []})

puts "Running animal and food classes.."
food_choices = [Chicken.new, CatFood.new, DogFood.new, HumanFood.new, Lemon.new]
food_choices.each do |food|
  tom.eats food
  rex.eats food
  rocky.eats food
end

sleep 1

puts "\nNow Running prime number finder...\n"
PrimeFinder.new(5).print_findings
PrimeFinder.new(0.005).print_findings(true)
