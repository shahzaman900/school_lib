require_relative 'app'
require_relative 'options'

def prompt
  puts 'Welcome to School Lib!'
  list = Options.new

  loop do
    list.all_options
    option = gets.chomp.to_i
    break if option == 7

    list.call_option(option)
  end
end

prompt
