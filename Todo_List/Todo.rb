class Task
  attr_reader :title, :description, :status, :created_at

  def initialize(hash)
    @title = hash.fetch(:title)
    @description = hash.fetch(:description)
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


task = Task.new(:title => "Title", :description => "description", :status => "complete", :created_at => '0805951')

puts task.title
