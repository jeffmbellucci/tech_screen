require 'prime'

class PrimeFinder
  attr_reader :runtime

  def initialize(seconds)
    @runtime = seconds
  end

  def find_primes(method = :fast)
    primes, n = [2, 3], 1
    ms_elapsed = 0
    start_ms = (Time.now.to_f * 1000).to_i
    loop do
      primes << 6*n-1 if prime?(6*n-1, method)
      primes << 6*n+1 if prime?(6*n+1, method)
      n += 1
      ms_elapsed = (Time.now.to_f * 1000).to_i - start_ms 
      break if ms_elapsed >= runtime * 1000
    end
    puts "Found #{primes.length} primes in #{ms_elapsed}ms, the #{method.to_s} way."
    primes
  end

  # Print nicely formatted findings
  def print_findings(print_all_primes = false)
    fast_primes, slow_primes = {fast_primes: find_primes(:fast)}, {slow_primes: find_primes(:slow)}
    puts fast_primes if print_all_primes
    puts "\n"
    puts slow_primes if print_all_primes
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

