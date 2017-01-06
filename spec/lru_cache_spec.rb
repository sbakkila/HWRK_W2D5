require 'lru_cache'
require 'rspec'

describe LRUCache do
  subject(:basic) {LRUCache.new(3)}

  describe '#initialize' do
    it 'initializes a cache with a given size' do
      expect(basic.size).to eq(3)
    end
  end


  describe '#count' do
    it "returns number of elements currently in cache" do
      expect(basic.count).to eq(0)
    end
  end

  describe '#add(el)' do
    it "adds element to cache according to LRU principle" do
      basic.add("Mario")
      basic.add("Wario")
      basic.add("Bowser")
      basic.add(true)
      basic.add(:App_Academy)

      expect(basic.cache).to eq([:App_Academy, true, "Bowser"])
    end
  end

  describe '#show' do
    it "shows the items in the cache, with the LRU item first" do
      basic.add("Mario")
      basic.add("Wario")
      basic.add("Bowser")
      basic.add(true)
      basic.add(:App_Academy)

      expect do
          basic.show
      end.to output("[\"Bowser\", true, :App_Academy]\n").to_stdout

      # expect(STDOUT).to receive(:p).with(["Bowser", true, :App_Academy])
      # basic.show
      # expect(basic.show).to eq(["Bowser", true, :App_Academy])
    end

  end
end
