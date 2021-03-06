# Class to assign random gift giver with confidence, that
# nobody will give himself a present and eatch other with somebody.
class RandomPresentsBetweenPeople
  def initialize(parameters)
    @names_count = parameters.length if parameters.class == Array
    @names_count = parameters if parameters.class == Fixnum
    return if @names_count > 2
    raise 'Too little names for suffiecient with requirements for draw. ' \
             'Maybe you missed space between names?'
  end

  def draw
    correct_combinations.sample
  end

  private

  def all_combinations
    initial_combination = Array(0..@names_count - 1)
    initial_combination.permutation.to_a
  end

  def correct_combinations
    all_combinations.reject { |combination| check_all_conditions(combination) }
  end

  def check_all_conditions(combination)
    anybody_gives_himself?(combination) || anybody_gives_each_other?(combination)
  end

  def anybody_gives_himself?(combination)
    combination.each_with_index do |entry, index|
      return true if index == entry
    end
    false
  end

  def anybody_gives_each_other?(combination)
    combination.each_with_index do |entry, index|
      return true if combination[index] == entry && combination[entry] == index
    end
    false
  end
end
