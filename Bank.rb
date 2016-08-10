require './Numgen.rb'

class Person
  def initialize(full_name, address, email, accountNo)
    @full_name = full_name
    @address = address
    @email = email
    @accountNo = accountNo
  end

  attr_accessor :full_name, :address, :email
  attr_reader :accountNo

end

class Account < Person
  def initialize(full_name=nil, address=nil, email=nil, accountNo=nil)
    @balance_in_file = File.open("balance#{accountNo}.txt", 'a+')
    @balance_in_file.write(0)
    @balance_in_file.rewind
    @balance = balance_in_file.read.to_i
    @balance_in_file.close
    super(full_name, address, email, accountNo)
  end

  def deposit(amount)
    @amount = amount.to_i
    @balance += @amount
    update
  end

   def withdrawal(amount)
    @amount = amount.to_i
    @balance -= @amount
    update
  end

  def update
    @balance_in_file = File.open("balance#{accountNo}.txt", 'r+')
    @balance_in_file.write(@balance)
    @balance_in_file.rewind
    @balance_in_file.close
  end

  attr_accessor :balance, :amount, :balance_in_file
end

numgen_1 = NumGen.new

account1 = Account.new("Andres", "157 Liverpool", "adad@dads.com", numgen_1.assign)
account2 = Account.new("Juan", "189 Kent", "adad@dads.com", numgen_1.assign)

puts account1.balance

account1.deposit(20)
puts "Balance 1 #{account1.balance}"
account1.deposit(20)
puts "Balance 1 #{account1.balance}"
account1.withdrawal(120)
puts "Balance 1 #{account1.balance}"
account2.deposit(20)
puts "Balance 2 #{account2.balance}"
account2.deposit(200)
puts "Balance 2 #{account2.balance}"
