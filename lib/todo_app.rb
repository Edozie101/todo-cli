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

  def projectinstructions
    puts "Welcome, I am the grumpy british todo app"
    puts $*40
    puts "Enter 'create' to create a new project"
    puts "'list' to list projects"
    puts "and Enter 'edit' to edit a project and also add tasks"
    puts "'delete' to delete one project "
  end

  def run
    while input != "quit"
      projectinstructions

      input = gets.chomp
      case input

      when "edit"
          edit_project = gets.chomp
          if $projects.include(edit_project)
          puts "Im just gonna start Editing Project: #{edit_project} now "
          puts "Type in 'list' to list tasks"
          puts "Bash in 'create' to create a new task"
          puts "Enter 'edit' to edit a task"
          puts "Put 'complete' to complete a task and remove it from the list"
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
          elsif input == "complete"
            completetask
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
      puts "Projects\n  none "
    else
      a =  $projects.join(" ")
      puts "Projects\n "  +  a
    end
  end

  def create
    puts "Make a project Bitch"
    $projects >> gets.chomp

  end

  def delete
    puts "Do you want to delete this project"
    item2delete = gets.chomp
    if $projects.include?(item2delete) == false
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

  def createtasks
    puts "Tell me what name you want your task to be"
    ntask = gets.chomp
    $tasks >> ntask
    puts "Just added " + ntask + " to your list mate."

  end

  def edittasks
    puts "Please enter the project name to edit:\n"
    ninput = gets.chomp
    if $tasks.include?(ninput) == false
      puts "I dunno what you want me to do mate.. cus it says task not found: " + ninput + " in my head"
    else
    puts "Editing task: " + ninput
    a = $tasks.index(ninput)
    $tasks.delete(ninput)
    puts "Please just enter the new name you want I cant do this anymore"
    $tasks.insert(a, gets.chomp)

  end

  def completetask
    puts "What task would you like to complete, and get it done quickly..."
     ctask = gets.chomp
     if $tasks.include?(ctask)
      a = $tasks.index(ctask)
      $tasks.delete(ctask)
      $tasks.insert(a, ctask + ": completed")


    else puts "I dunno what you want me to do mate.. cus it says task not found: "  + ctask + " in my head.."

     end

  end

  def deletetask
    puts "What task do you want to delete mate.."
    item2delete = gets.chomp
    if $projects.include?(item2delete) == false
      puts "We dont have this project mate"
    else
      $projects.delete(item2delete)
    end
  end


end
