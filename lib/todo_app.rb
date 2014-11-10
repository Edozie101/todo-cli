class TodoApp < CommandLineApp

  def initialize(input, output)
    @input = input
    @output = output
  end
  def r_puts message=""
    $stdout.puts message

  end
  def r_gets message=""
    $stdin.gets message
  end
  def run
    $projhash = {}
    puts "Welcome"
    puts "'create' to create a new project"
    puts "'list' to list projects"
    puts "'edit' to edit a project"

      input  = gets

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

  $projhash{ tasks: { name: } }

  def edit
    puts "Please enter the project name to edit:\n"
  end

  def list
    puts "Here are all of your projects"
  end

  def create
    puts "Make a project Bitch"
  end

  def delete
    puts "Do you want to delete this project"
  end


end
