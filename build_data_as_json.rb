require 'find'
require 'json'
json = {}
Find.find('./data') do |filename|
  if filename != "./data"
    name = filename[filename.rindex('/')+1..filename.length]
    types = File.read(filename).split(',')
    stripped_types = []
    for type in types
      stripped_types << type.strip
    end
    json[name] = stripped_types
  end
end
File.open('pokemon.json', 'w') do |f|
  f.write(json.to_json)
end
