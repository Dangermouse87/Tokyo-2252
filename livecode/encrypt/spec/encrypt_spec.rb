require_relative "../encrypt"

# Rspec

# 1 - describe -> what method we need to look at
# 2 - it -> describe what the test should be doing, in plain english
# 3 - expect -> call the method, and compare it the expected result

describe "#encrypt" do
  it "should return a String" do
    expect(encrypt('')).to be_a(String)
  end
  
  it "should return an encrypted sentence" do
    expect(encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")).to eq("QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD")
  end

  it "should return an encrypted sentence with punctuation" do
    expect(encrypt("THE, QUICK BROWN FOX JUMPS OVER THE LAZY DOG!")).to eq("QEB, NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD!")
  end
end