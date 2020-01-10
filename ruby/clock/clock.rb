class Clock
  include Comparable

  HOURS_PER_DAY    = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY  = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(hour: 0, minute: 0)
    @minutes = normalize(hour, minute)
  end

  def to_s
    "#{hour_in_string}:#{minute_in_string}"
  end

  def +(other)
    self.class.new(minute: minutes + other.minutes)
  end

  def -(other)
    self.class.new(minute: minutes - other.minutes)
  end

  def <=>(other)
    minutes <=> other.minutes
  end

  protected

  attr_accessor :minutes

  private

  def normalize(hour, minute)
    time = (hour % HOURS_PER_DAY) * MINUTES_PER_HOUR
    time = time + minute
    time = time % MINUTES_PER_DAY

    time.negative? ? time + MINUTES_PER_DAY : time
  end

  def hour_in_string
    (minutes/MINUTES_PER_HOUR % HOURS_PER_DAY).to_s.rjust(2, '0')
  end

  def minute_in_string
    (minutes % MINUTES_PER_HOUR).to_s.rjust(2, '0')
  end
end
