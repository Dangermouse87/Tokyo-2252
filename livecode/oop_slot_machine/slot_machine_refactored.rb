SYMBOLS = %w[🍒 7️⃣ 🛎 ⭐️ 🤩]
          #   0   1  2  3  4 (index)
          #   1   2  3  4  5 * 10 (if 3 of a kind (🤩🤩🤩))
          #   5  10 15 20 25 * 5  (if 2 of a kind + 1 ⭐⭐🤩) 
          #  10  20 30 40 50

class SlotMachine
  attr_reader :reels
  def initialize(reels)
    @reels = reels
  end

  def score # with if
    # check symbols:
    # if three of the same, return the highest score dep on the symbol
    # if @reels.uniq == @reels[0]
    if @reels.uniq.size == 1
      puts @reels.join(" ")
      (SYMBOLS.index(@reels[0]) + 1 ) * 10
    # if two of the same + joker, return the corresp score dep on the symbol
    elsif @reels.count("🤩") == 2
      puts @reels.join(" ")
      25
    elsif @reels.uniq.size == 2 && @reels.include?("🤩")
      other_reel = @reels[0] == "🤩" ? @reels[1] : @reels[0]
      puts @reels.join(" ")
      (SYMBOLS.index(other_reel) + 1 ) * 5
    # else return zero
    else
      puts @reels.join(" ")
      0
    end
  end

  def score # with case
    case 
    when @reels.uniq.size == 1
      (SYMBOLS.index(@reels[0]) + 1) * 10
    # if two of the same + joker, return the corresponding score depending on the symbol
    when @reels.count("🤩") == 2
      25
    # check for 2 of a kind + a joker
    when @reels.uniq.size == 2 && @reels.include?("🤩")
      other_reel = @reels[0] == "🤩" ? @reels[1] : @reels[0]
     (SYMBOLS.index(other_reel) + 1) * 5
    # else return zero
    else
      0
    end
  end
end