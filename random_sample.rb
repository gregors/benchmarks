require 'benchmark/ips'

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)

  # These parameters can also be configured this way
  # Typical mode, runs the block as many times as it can
  x.report("old using sample") {
    (1..10000).to_a.sample(500).sort
  }

  x.report("new map random") {
    500.times.map{|x| Random.rand(1..10_000)}
  }

  # Compare the iterations per second of the various reports!
  x.compare!
end
