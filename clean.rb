File.readlines('./remaining.txt').each do |name|
  name.gsub! /\s+/, ''
  if File.exists? "./types/#{name}"
    puts 'deleting'
    File.delete("types/#{name}")
  end
end