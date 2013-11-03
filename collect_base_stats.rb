require_relative('base_stats_query')
require_relative('base_stats_query_parser')

pokemon_names = File.readlines('remaining.txt')
pokemon_names[0..0].each do |name|
  name.gsub!(/\s+/, '')
  pokemon_query = TypeQuery.new
  data = pokemon_query.query(name)
  base_stats = BaseStatsQueryParser.new().get_base_stats(data)
  puts "Name: #{name} Base stats: #{types}"
  File.open("./base_stats/#{name}", 'w') do |f|
    f.write(types.join(','))
  end
end