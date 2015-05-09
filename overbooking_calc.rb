# overbooking calculator (c) by phime42

# binomial coefficient function (c) by rosettacode.com contributors
# licensed under the GNU FDL version 1.3


# airlines often have to deal with empty seats in airplanes, even though the
# plane is fully booked. In order to maximise fuel efficiency and revenues,
# the airline companies tend to overbook their flights by a certain number,
# resulting in the risk that sometimes no place is available for legitimate
# ticket owners. This script evaluates the chance that everybody gets a seat.

class Overbook
  def initialize(number_of_seats, number_of_sold_tickets, chance_of_unused_seat)
    @result = 0
    for k in 0..number_of_seats do
      @result = @result + c(number_of_sold_tickets, k)*((1-chance_of_unused_seat)**k)*chance_of_unused_seat**(number_of_sold_tickets-k)
    end
  end

  def p
    @result
  end

  private
  def c n, r
   (0...r).inject(1) do |m,i| (m * (n - i)) / (i + 1) end
  end
end

puts Overbook.new(330, 340, 0.035).p  # example of a overbooking of 10 tickets (330 avail. seats and 340 seats) with a
                                      # chance of 3.5% chance of a passenger not taking the flight
