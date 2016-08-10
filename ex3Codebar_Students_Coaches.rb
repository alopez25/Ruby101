class Members
  def initialize(full_name)
    @full_name = full_name
  end

  attr_reader :full_name

end

class Student < Members
  def initialize(full_name, about=nil)
    @about = about
    super(full_name)
  end

  attr_reader :about

end


class Coach < Members
  def initialize(full_name, bio=nil, skill=nil)
    @bio = bio
    @skill=[skill]
    super(full_name)
  end

  attr_reader :bio, :skill

  def add_skill(skill)
    @skill << skill
  end

end

class Workshop
  def initialize (date, venue_name)
    @date = date
    @venue_name = venue_name
    @coaches = Array.new
    @students = Array.new
  end

  def add_participant(name)
    @name = name
    if @name.class == Student
      @students.push name
    elsif @name.class == Coach
      @coaches.push name
    end
  end

  attr_reader :date, :venue_name, :name, :coaches, :students

  def print_details
    count = 1
    system "cls"
    puts "\nWorkshop - #{@date} - Venue: #{@venue_name}" + "\n"*2
    puts "-"*40 + "\n"*2
    puts "Coaches\n\n"
    @coaches.each_with_index { |x,y| puts "#{y+1}.- " "#{x.full_name} - #{x.skill.join(" ")}\n    #{x.bio}\n"}
    puts ""
    puts "Students\n\n"
    @students.each_with_index { |x,y| puts "#{y+1}.- " "#{x.full_name} - #{x.about} "}
  end
end

# "#{coaches.size}"
workshop1 = Workshop.new("12/03/2014", "Shutl")

jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")
lena = Student.new("Lena Smith", "I am really excited about learning to program!")
vicky = Coach.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")
nicole = Coach.new("Nicole McMillan", "I have been programming for 5 years in Ruby and want to spread the love")
nicole.add_skill("Ruby")
js = Coach.new("Johann Sebastian Bach", "I just want to do music", "Piano")

workshop1.add_participant(jane)
workshop1.add_participant(lena)
workshop1.add_participant(vicky)
workshop1.add_participant(nicole)
workshop1.add_participant(js)

workshop1.print_details
#workshop1.coaches.each_with_index { |x, y| puts x, puts y }
#{coaches.size}"
#puts workshop1.coaches.methods.sort
#workshop1.coaches.each_with_index { |val,index| puts "index: #{index} for #{val}"}
