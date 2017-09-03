class Triangle

  def initialize(length_one, length_two, length_three)
    @length_one = length_one
    @length_two = length_two
    @length_three = length_three
    raise TriangleError if self.no_length || too_long
  end

  def kind
    if @length_one == @length_two && @length_two == @length_three
      :equilateral
    elsif @length_one == @length_two || @length_one == @length_three || @length_two == @length_three
      :isosceles
    else
      :scalene
    end
  end

  def no_length
    @length_one <= 0 || @length_two <= 0 || @length_three <= 0
  end

  def too_long
    sorted_lengths = [@length_one, @length_two, @length_three].sort
    sorted_lengths[2] >= sorted_lengths[1] + sorted_lengths[0]
  end



end

class TriangleError < StandardError
  puts "Those lengths don't make sense for a triangle."
end
