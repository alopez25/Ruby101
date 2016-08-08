
# attr_reader :start, :finish, :progress
class ProgressBar

  def initialize(start, finish)
    @start = start
    @finish = finish
    @progress = @start
  end

  def advance
    @progress = @progress + 1
  end

  def status
    puts "Progress (#{@progress} / #{@finish})"
  end

end
