require 'json'
require_relative('base_stats_query')
require_relative('base_stats_query_parser')

pokemon_names = File.readlines('remaining.txt')
pokemon_names.each do |name|
  name.strip!
  pokemon_query = BaseStatsQuery.new
  data = pokemon_query.query(name)
  base_stats = BaseStatsQueryParser.new().get_base_stats(data)
  puts "Name: #{name} Base stats: #{base_stats}"
  File.open("./base_stats/#{name}", 'w') do |f|
    f.write(base_stats.to_json)
  end
end