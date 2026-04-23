require_relative "../slot_machine"

# describe -> the method we are testing
# it -> what should the method do
# expect -> what output are we 

describe SlotMachine do
  describe '#score' do
    it "should return 0 for 🍒 7️⃣ 🛎 " do
      expected = 0
	      slot_machine = SlotMachine.new(%w[🍒 7️⃣ 🛎])
      # slot_machine is an instance of SlotMachine
      actual = slot_machine.score
      expect(actual).to eq(expected)
    end
  end
end

# We can use methods in our spec files to test.
def test_scenario(reels, score)
  it "should return #{score} for #{reels.join(" ")}" do
    expected = score
    slot_machine = SlotMachine.new(reels)
    # slot_machine is an instance of SlotMachine
    actual = slot_machine.score
    expect(actual).to eq(expected)
  end
end

describe SlotMachine do
  describe '#score' do
    test_scenario(%w[🍒 7️⃣ 🛎], 0)
    test_scenario(%w[⭐️ 🛎 7️⃣], 0)
    test_scenario(%w[🤩 🤩 🤩], 50)
    test_scenario(%w[⭐️ ⭐️ ⭐️], 40)
    test_scenario(%w[🛎 🛎 🛎], 30)
    test_scenario(%w[7️⃣ 7️⃣ 7️⃣], 20)
    test_scenario(%w[🍒 🍒 🍒], 10)
    test_scenario(%w[🤩 ⭐️ ⭐️], 20)
    test_scenario(%w[🤩 🛎 🛎], 15)
    test_scenario(%w[🤩 7️⃣ 7️⃣], 10)
    test_scenario(%w[🤩 🍒 🍒], 5)
    test_scenario(%w[🤩 🤩 ⭐️], 25)
    test_scenario(%w[🤩 🤩 🛎], 25)
    test_scenario(%w[🤩 🤩 7️⃣], 25)
    test_scenario(%w[🤩 🤩 🍒], 25)
  end
end