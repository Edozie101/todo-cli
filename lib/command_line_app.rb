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
    while @input != "quit"
      @input = gets
    end

  end


end
