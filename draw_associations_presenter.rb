# Prints assignments - consumes result table with names table
# (which default is ARGV)
class DrawAssociationsPresenter
  def self.print(result, names)
    puts '---------------------------------------------------------------'
    result.each_with_index do |assignment, index|
      puts "#{names[index]} gives gift to #{names[assignment]}"
    end
    puts '---------------------------------------------------------------'
  end
end
