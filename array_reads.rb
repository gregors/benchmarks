# https://stackoverflow.com/questions/22075055/are-ruby-arrays-true-arrays
# https://ruby-hacking-guide.github.io/object.html
# https://github.com/ruby/ruby/blob/trunk/array.c


require 'benchmark/ips'

@a = (1..1_000_000).to_a
@linear = (0..999_999).to_a
@rand = (0..999_999).to_a.shuffle

def linear_access 
  count = 0 
  @linear.each do |x|
    @a[x]
    count += 1
  end
  count
end

def random_access
  count = 0 
  @rand.each do |x|
    @a[x]
    count += 1
  end
  count
end

Benchmark.ips do |x|
  x.report('linear access: ') { linear_access }
  x.report('random access: ')   { random_access }

  x.compare!
end
