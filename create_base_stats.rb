require 'json'
name = ARGV[0]
stats = {hp: Integer(ARGV[1]),
         attack: Integer(ARGV[2]),
         defense: Integer(ARGV[3]),
         special_attack: Integer(ARGV[4]),
         special_defense: Integer(ARGV[5]),
         speed: Integer(ARGV[6])}
File.open("./base_stats/#{name}", 'w') do |f|
  f.write(stats.to_json)
end