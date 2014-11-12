class TodoApp < CommandLineApp

  def initialize(input, output)
    @input = input
    @output = output
    $projects = []
    $tasks = []

  end
  def r_puts message=""
    $stdout.puts message

  end
  def r_gets message=""
    $stdin.gets message
  end
  def run
    puts "Welcome"
    puts "'create' to create a new project"
    puts "'list' to list projects"
    puts "'edit' to edit a project"

      input  = gets.chomp

    while input != "quit"
      input = gets.chomp
      case input

      when "edit"
          edit_project = gets.chomp
          if $projects.include(edit_project)
          puts "Editing Project: #{edit_project} "
          puts "'list' to list tasks"
          puts "'create' to create a new task"
          puts "'edit' to edit a task"
          puts "'complete' to complete a task and remove it from the list"
        else
          puts "What the fook are you tawkin aboot"
        end

        editing = true
        while editing
           input = gets.chomp
          if input == "back"
            puts "Lets go back to Main Menu then"
            editing = false

          elsif input == "list"
            listtasks
          elsif input == "edit"
            edittasks
          elsif input == "delete"
            deletetasks

          end
        end

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


  def edit
    puts "Please enter the project name to edit:\n"
    ninput = gets.chomp
    if $projects.include(ninput) == false
      puts "I dunno what you want me to do mate.."
    else
    puts "Editing project: " + ninput
    a = $projects.index(ninput)
    $projects.delete(ninput)
    puts "Please enter the new name you want"
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
    if $projects.include(item2delete) == false
      puts "We dont have this project mate"
    else
      $projects.delete(item2delete)
    end
  end

  def listtasks
    if $tasks.empty? != true
      tasks = $tasks.join(" ")
      tasks
    else
      "none"

    end

  end



end
