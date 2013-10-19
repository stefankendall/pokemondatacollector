require 'find'
require 'json'
json = {}
Find.find('./data') do |filename|
  if filename != "./data"
    name = filename[filename.rindex('/')+1..filename.length]
    types = File.read(filename).split(',')
    json[name] = types
  end
end
File.open('pokemon.json', 'w') do |f|
  f.write(json.to_json)
end
