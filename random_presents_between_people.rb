# Class to assign random gift giver with confidence, that
# nobody will give himself a present and eatch other with somebody.
class RandomPresentsBetweenPeople
  def initialize(parameters)
    @names = parameters
    raise 'Too little names for suffiecient with requirements for draw. Maybe you missed space between names?' if @names.count < 3
  end

  def draw
    correct_combinations.sample
  end

  private

  def all_combinations
    initial_combination = Array(0..@names.count - 1)
    initial_combination.permutation.to_a
  end

  def correct_combinations
    return [] if @names.empty? || @names.count < 3
    all_combinations.reject do |combination|
      check_all_conditions(combination)
    end
  end

  def check_all_conditions(combination)
    nobody_gives_himself(combination) || nobody_gives_each_other(combination)
  end

  def nobody_gives_himself(combination)
    combination.each_with_index do |entry, index|
      return true if index == entry
    end
    false
  end

  def nobody_gives_each_other(combination)
    combination.each_with_index do |entry, index|
      return true if combination[index] == entry && combination[entry] == index
    end
    false
  end
end