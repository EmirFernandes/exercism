=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

class TwelveDays
  class << self
    def song
      (1..12).map { |n| line(n) }.join("\n")
    end

    private

    DAYS = {
      1  => { day: :first,    phase: 'a Partridge in a Pear Tree' },
      2  => { day: :second,   phase: 'two Turtle Doves'           },
      3  => { day: :third,    phase: 'three French Hens'          },
      4  => { day: :fourth,   phase: 'four Calling Birds'         },
      5  => { day: :fifth,    phase: 'five Gold Rings'            },
      6  => { day: :sixth,    phase: 'six Geese-a-Laying'         },
      7  => { day: :seventh,  phase: 'seven Swans-a-Swimming'     },
      8  => { day: :eighth,   phase: 'eight Maids-a-Milking'      },
      9  => { day: :ninth,    phase: 'nine Ladies Dancing'        },
      10 => { day: :tenth,    phase: 'ten Lords-a-Leaping'        },
      11 => { day: :eleventh, phase: 'eleven Pipers Piping'       },
      12 => { day: :twelfth,  phase: 'twelve Drummers Drumming'   }
    }

    def line(number)
      "On the #{day(number)} day of Christmas my true love gave to me: #{elements(number)}.\n"
    end

    def day(number)
      DAYS[number][:day]
    end

    def elements(number)
      return DAYS[1][:phase] if number == 1

      beginning = (2..number).map { |n| DAYS[n][:phase] }.reverse.join(', ')

      "#{beginning}, and #{DAYS[1][:phase]}"
    end
  end
end
