require_relative('type_query')
require_relative('type_query_parser')

pokemon_names = File.readlines('remaining.txt')
pokemon_names.each do |name|
  name.gsub!(/\s+/, '')
  pokemon_query = TypeQuery.new
  data = pokemon_query.query(name)
  types = TypeQueryParser.new().get_types(data)
  puts "Name: #{name} types: #{types}"
  File.open("./types/#{name}", 'w') do |f|
    f.write(types.join(','))
  end
end