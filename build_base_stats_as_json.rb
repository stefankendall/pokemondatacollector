require 'find'
require 'json'
json = {}
Find.find('./base_stats') do |filename|
  if filename != "./base_stats"
    name = filename[filename.rindex('/')+1..filename.length]
    stats = File.read(filename)
    json[name] = JSON.parse(stats)
  end
end
File.open('base_stats.json', 'w') do |f|
  f.write(json.to_json)
end
