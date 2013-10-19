require_relative('pokemon_query')
require_relative('query_parser')

pokemon_names = File.readlines('all-pokemon.txt')
pokemon_names.each do |name|
  name.gsub!(/\s+/, '')
  pokemon_query = PokemonQuery.new
  data = pokemon_query.query(name)
  types = QueryParser.new().get_types(data)
  puts "Name: #{name} types: #{types}"
  File.open("./data/#{name}", 'w') do |f|
    f.write(types.join(','))
  end
end