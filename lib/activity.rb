class Activity
  attr_reader :name,
              :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(person, cost)
    @participants[person] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.length
  end

  def owed
    amount_owed = Hash.new(0)
    @participants.each do |participant , paid|
      amount_owed[participant] = split - paid
    end
    amount_owed
  end
end
