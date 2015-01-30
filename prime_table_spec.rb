require 'minitest/autorun'
require './prime_table'

describe PrimeTable do
  
  let (:small_tbl) { PrimeTable.new(3) }
  let (:medium_tbl) { PrimeTable.new(10) }
  let (:large_tbl) { PrimeTable.new(100) }

  describe "when getting prime numbers" do
    it "should return the correct primes list" do
      small_tbl.primes.must_equal [2,3,5]
      medium_tbl.primes.must_equal [2,3,5,7,11,13,17,19,23,29]
    end

    it "should return the correct number of primes" do
      medium_tbl.primes.size.must_equal 10
      large_tbl.primes.size.must_equal 100
    end

    it "should handle negative input" do
      proc { PrimeTable.new(-1)}.must_raise ArgumentError
    end
  end
end