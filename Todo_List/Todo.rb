class Task
  attr_reader :title, :description, :status, :created_at

  def initialize(hash)
    @title = hash[:title]
    @description = hash[:description]
    @status = hash[:status]
    @created_at = hash[:created_at]
  end
end


task = Task.new(:title => "Title", :description => "description", :status => "complete", :created_at => '0805951')

puts task.title
