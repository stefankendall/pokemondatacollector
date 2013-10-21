require 'find'

unique_types = []
Find.find('./data') do |filename|
  if filename != "./data"
    types = File.read(filename).split(',')
    for type in types
      type.strip!
      unless unique_types.include? type
        unique_types << type
      end
    end
  end
end

puts unique_types
puts unique_types.length