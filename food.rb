class Food
  include Underscore
  # Included to_s method to give something for the different foods to inherit
  def to_s
    underscore(self.class.name).tr('_', ' ')
  end
end

class Chicken < Food; end
class CatFood < Food; end
class DogFood < Food; end
class HumanFood < Food; end
class Milk < Food; end
class Lemon < Food; end
