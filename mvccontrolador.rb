require_relative 'mvcmodelo.rb'
require_relative 'mvcvista.rb'

class Maincontroller

  def initialize(input)
    @input = input
    @view = View.new
    @model = Record.new
    menu(input)
  end

  def menu(input) 
    transaction = input[0]
    task = input[1..-1].join(" ")
    task_number = input[1]
      case transaction
        when "add" then add(task)
        when "delete" then delete(task_number)
        when "index" then index
        when "complete" then complete(task_number)
      end  
  end

  def index
    tasks = @model.index 
    @view.show_tasks(tasks)
  end 

  def add(task)
    new_task = Task.new(task)
    @model.add(new_task)
    @view.show_add(new_task)
  end
  
  def delete(task_number)
    task = @model.delete(task_number)
    @view.show_delete(task[0])
  end

  def complete(task_number)
    task = @model.complete(task_number)
    @model.complete(task_number)
    @view.show_complete(task[0])
  end



end

input = ARGV

Maincontroller.new(input)

