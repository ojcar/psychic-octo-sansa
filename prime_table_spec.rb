require 'minitest/autorun'
require './prime_table'

describe PrimeTable do
  describe "when getting prime numbers" do
    before do
      @tbl = PrimeTable.new
    end

    it "should return the correct primes list" do
      @tbl.n = 3
      @tbl.primes.must_equal [2,3,5]

      @tbl.n = 10
      @tbl.primes.must_equal [2,3,5,7,11,13,17,19,23,29]
    end

    it "should return the correct number of primes" do
      @tbl.n = 10
      @tbl.primes.size.must_equal 10

      @tbl.n = 100
      @tbl.primes.size.must_equal 100
    end
  end
end