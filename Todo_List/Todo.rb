class Task
  attr_accessor :title, :description, :status, :created_at

  def initialize(hash={})
    @title = hash.fetch(:title, "Title")
    @description = hash.fetch(:description, "Description")
    @status = hash.fetch(:status, "incomplete")
    @created_at = hash.fetch(:created_at, Time.now)
  end

  def mark_as_complete!
    @status = "complete"
  end

  def mark_as_incomplete!
    @status = "incomplete"
  end

  def complete?
    @status == "complete" ? true : false
  end

end

class Todolist
  attr_accessor :title, :tasks
  def initialize()
    @title = ""
    @tasks = []
  end
  def add_task(task_obj)
    @tasks << task_obj
  end
  def complete_all!
    @tasks.each{
      |task|
      task.status = "complete"
    }
  end
  def complete?
    @tasks.map(&:status).include?("incomplete") ? false : true
  end

  def completed_tasks
    @tasks.select{ |task| task.status == "complete"}
  end

  def incomplete_tasks
    @tasks.select{ |task| task.status == "incomplete"}
  end
end


