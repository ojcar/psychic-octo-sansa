class PrimeTable
  attr_accessor :n

  def initialize(n=10)
    @n = n
  end

  def primes
    get_primes_with_sieve
  end

  def print
    table.each do |i|
      i.each {|x| printf("%5s",x) }
      puts ""
    end
  end

  private
  def table
    [[""].concat(primes)] + primes.map do |i|
      [i] + primes.map {|j| i * j }
    end
  end

  def upper_bound
    if @n >= 6
      @n * (Math.log(@n) + Math.log(Math.log(@n)))
    else
      # estimate breaks for n<6; 
      # but we know the sixth prime is 13, so hardcoding this.
      15
    end
  end

  # just look at all the numbers up to an upper bound
  # ok for small numbers, gets slow very quickly
  def get_primes_with_list
    (2..upper_bound).reject do |i|
      (2...i).any? {|j| i % j == 0 }
    end.take(@n)
  end

  # the sieve of Eratosthenes algorithm
  # better handling of large numbers
  def get_primes_with_sieve
    result = [nil,nil] + (2..upper_bound).to_a

    (2..Math.sqrt(upper_bound)).each do |i|
      (i**2..upper_bound).step(i) {|j| result[j] = nil }
    end
    
    result.compact.take(@n)
  end
end

if __FILE__== $0
  if ARGV.length == 1
    n = ARGV[0].to_i
    PrimeTable.new(n).print
  else
    PrimeTable.new.print
  end
end