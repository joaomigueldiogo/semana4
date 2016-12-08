class View 

  def show_tasks(tasks)
    tasks.each_with_index do |task, index|
      if task.status == "false"
        puts "#{index + 1}. [ ] #{task.tasks}" 
      elsif task.status == "true"
        puts "#{index + 1}. [X] #{task.tasks}" 
      end
    end
  end

  def show_add(task)
    puts "Agregaste la tarea: #{task.tasks} a tu lista."
  end

  def show_delete(task_number)
    puts "Eliminaste la tarea: #{task_number.tasks} de tu lista."
  end

  def show_complete(task_number)
    puts "Completaste la tarea: #{task_number.tasks}."
  end

end