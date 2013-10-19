File.readlines('./remaining.txt').each do |name|
  name.gsub! /\s+/, ''
  if File.exists? "./data/#{name}"
    puts 'deleting'
    File.delete("data/#{name}")
  end
end