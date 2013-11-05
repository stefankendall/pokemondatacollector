require 'json'

base_stats = JSON.parse File.read('base_stats.json')
types = JSON.parse File.read('types.json')

pokemon = {}
types.each do |name, pokemon_types|
  unless base_stats.has_key? name
     abort "Missing base stats for #{name}"
  end
  pokemon[name] = {:types => pokemon_types, :stats => base_stats[name]};
end

File.open('pokemon.json', 'w') do |f|
  f.write(pokemon.to_json)
end
