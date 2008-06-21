class Dice


  def self.roll(mode,count=1)
    result = 0
    case mode
      # Custom Rolls
      when "generate_ability_scores"
        result = []
        rolls = 20
        lowest = rolls-6
        rolls.times {srand(); result << self.roll('d6',3)}
        result.sort!
        lowest.times {result.shift}
        result.join(",")+ " (3d6, #{rolls} times, dropping lowest #{lowest} totals)"

      when "generate_fighter_money"
        result = self.roll('d4',6)
        (result * 10).to_s + " gold"

      # Standard Dice
      when "d4"
        count.times {
          srand()
          result = result +  (1 + rand(4))
        }
        result
      when "d6"
        count.times {
          srand()
          result = result +  (1 + rand(6))
        }
        result

    end
  end


end
