class NumGen
  def initialize
    @accountNo = nil
    @used_AccountNo = []
  end

  attr_accessor :accountNo, :used_AccountNo

def assign
    proposed_No = rand(1000000000)
  while @used_AccountNo.include?(proposed_No) do
    proposed_No = rand(1000000000)
    @used_AccountNo << proposed_No
  end
    @used_AccountNo << proposed_No
    @accountNo = proposed_No
    return @accountNo
end
end
