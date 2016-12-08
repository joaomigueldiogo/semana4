require 'csv'

class Task
  attr_accessor :tasks, :status

  def initialize(tasks, status = false)
    @tasks = tasks
    @status = status
  end
 
end

class Record

  def add(tasks)
    CSV.open("prueba.csv", "a") do |csv|
      csv << [tasks.tasks, tasks.status]
    end
  end


  def index
    @array_tasks = []
    csv_array_tasks = CSV.read("prueba.csv", "r+")
    csv_array_tasks.each do |row|
      @array_tasks << Task.new(row[0], row[1])
    end
    @array_tasks
  end

  def delete(task_number)
    index
    @new_array_tasks = []
    @task_deleted = []
    @array_tasks.each_with_index do |task, index|
      if task_number.to_i != index + 1
        @new_array_tasks << task
      else
        @task_deleted << task
      end
    end
    CSV.open("prueba.csv", "wb") do |csv|
      @new_array_tasks.each do |task|
        csv << [task.tasks, task.status]
      end
    end
    @task_deleted
  end

  def complete(task_number)
    index
    @complete_array_tasks = []
    @task_completed = []
    @array_tasks.each_with_index do |task, index|
      if task_number.to_i == index + 1
        task.status = true
        @complete_array_tasks << task
        @task_completed << task
      elsif task_number.to_i != index + 1
        @complete_array_tasks << task
      end
      @complete_array_tasks
    end
    CSV.open("prueba.csv", "wb") do |csv|
      @complete_array_tasks.each do |task|
        csv << [task.tasks, task.status]
      end
    end
  @task_completed
  end
end
