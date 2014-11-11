class CommandLineApp
  attr_reader :input, :output

  def puts(message)
    output.puts(message)
  end

  def gets
    input.gets
  end

  def initialize(input, output)
    @input = input
    @output = output
  end
  def run
    @input  = gets.chomp

    puts "Welcome"
    puts "'create' to create a new project"
    puts "'list' to list projects"
    puts "'edit' to edit a project"
    while input != "quit"
      input = gets.chomp
      case input

      when "edit"
        edit
      when "create"
        create
      when "list"
        list
      when "delete"
        delete
      else
        puts "I dont know what you want me to do"
      end
    end

  end


end
