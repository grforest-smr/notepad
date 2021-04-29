if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'task.rb'
require_relative 'memo.rb'


puts "Привет, я твой блокнот!"
puts "Что хотите записать сегодня?"

choises = Post.post_types

choise = -1

until choise >= 0 && choise < choise.size
  choises.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choise = STDIN.gets.chomp.to_i
end

entry = Post.create(choise)

entry.read_from_console

entry.save

puts "Ок. Запись сохранена"