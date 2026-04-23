# Let's implement a SlotMachine class with 3 reels. Each reel has 3 different items.

# SlotMachine.new(%w[🍒 7️⃣ 🛎]) => already played slot machine
# SlotMachine.new             => ready to play slot machine

# The class has one public instance method, score, following these rules:

# Item	      Three of the same	  Two of the same + Joker
# Joker   🤩	50	                25 (2 jokers + anything)
# Star    ⭐️	40	                20
# Bell    🛎	30	                15
# Seven   7️⃣	20	                10
# Cherry  🍒	10	                5

SYMBOLS = %w[🍒 7️⃣ 🛎 ⭐️ 🤩]
          #   0   1  2  3  4 (index)
          #   1   2  3  4  5 * 10 (if 3 of a kind (🤩🤩🤩))
          #   5  10 15 20 25 * 5  (if 2 of a kind + 1 ⭐⭐🤩) 
          #  10  20 30 40 50

class SlotMachine
  def initialize(reels)
    # what do we do with the reels that we are given
    @reels = reels
  end

  def score
    # @reels is an array
    puts @reels.join("  ")
    # check symbols
    case
    # checking 3 of a kind
    when @reels.uniq.size == 1
      (SYMBOLS.index(@reels[0]) + 1) * 10
    # checking for 2 jokers
    when @reels.count("🤩") == 2
      25
    # check for 2 of a kind + a joker
    when @reels.uniq.size == 2 && @reels.include?("🤩")
      if @reels[0] == "🤩"
        (SYMBOLS.index(@reels[1]) + 1) * 5
      else
        (SYMBOLS.index(@reels[0]) + 1) * 5
      end
    # else no score
    else
      0
    end
  end
end

slot_machine = SlotMachine.new( [SYMBOLS.sample, SYMBOLS.sample, SYMBOLS.sample] )
# slot_machine = SlotMachine.new( ["⭐️", "🤩", "⭐️"] )
p slot_machine.score