require 'prime'

class PrimeNumberFinder
  attr_accessor :runtime

  def initialize(seconds, print_all_primes = false)
    @runtime = seconds
    print_primes(print_all_primes)
  end

  def find_primes(method)
    primes, n = [2, 3], 1
    @ms_elapsed = 0
    start_ms = (Time.now.to_f * 1000).to_i
    loop do
      primes << 6*n-1 if prime?(6*n-1, method)
      primes << 6*n+1 if prime?(6*n+1, method)
      n += 1
      @ms_elapsed = (Time.now.to_f * 1000).to_i - start_ms 
      break if @ms_elapsed >= runtime * 1000
    end
    primes
  end

  # Print largest prime and total primes and amount of time past in nicely formatted output
  def print_primes(print_all_primes)
    [:fast, :slow].each do |method|
      primes = find_primes(method)
      puts "#{primes.last} is the largest of #{primes.length} total primes found in #{@ms_elapsed}ms, the #{method.to_s} way.\n\n"
      puts "All #{method.to_s} primes: #{primes.to_s}\n\n" if print_all_primes
    end
    nil
  end
  
  private

  def prime?(n, method)
    if method == :fast # Ruby Prime library
      Prime.prime?(n)
    elsif method == :slow # Brute force
      factors = []
      1.upto(n/3) { |factor| factors << n if (n % factor).zero? }
      factors.length == 1
    end
  end
end

