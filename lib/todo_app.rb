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

   $projects = []

  def edit
    puts "Please enter the project name to edit:\n"
    ninput = gets.chomp
    a = $projects.index(ninput)
    $projects.delete(ninput)
    $projects.insert(a, gets.chomp)
  end


  def list
    puts "Here are all of your projects"
    if $projects.empty? == true
      return "Projects\n   none "
    else
      a =  $projects.join(" ")
      return "Projects\n "  +  a
    end
  end

  def create
    puts "Make a project Bitch"
    $projects >> gets.chomp

  end

  def delete
    puts "Do you want to delete this project"
    item2delete = gets.chomp
    $projects.delete(item2delete)
  end


end
