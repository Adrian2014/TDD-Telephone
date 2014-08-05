require_relative('Todo')

describe 'task' do

  before do
      @task = Task.new(:title => "Title", :description => "description", :status => "complete", :created_at => '0805951')
      @taskII = Task.new(:title => "Title", :description => "description")
  end

  it 'should have attribute title'  do
    expect(@task.title).to eq "Title"
  end

  it 'should have attribute description'  do
    expect(@task.description).to eq "description"
  end

  it 'should have attribute status'  do
    expect(@task.status).to eq "complete"
  end

  it 'should have attribute created_at'  do
    expect(@task.created_at).to eq '0805951'
  end


  it 'should have a default status of incomplete'  do
    expect(@taskII.status).to eq 'incomplete'
  end

  it 'should automatically set a created_at timestamp on initialization'  do
    expect(@taskII.created_at).not_to be_nil
  end

  it 'should have a method mark_as_complete! which sets its status to complete' do
    @taskII.mark_as_complete!
    expect(@taskII.status).to eq 'complete'
  end

  it 'should have a method mark_as_incomplete! which sets its status to incomplete' do
    @taskII.mark_as_complete!
    @taskII.mark_as_incomplete!
    expect(@taskII.status).to eq 'incomplete'
  end

  describe '#complete?' do
    it 'should return false if the task has not been completed' do
      expect(@taskII.complete?).to eq(false)
    end

    it 'should return true if the task has been completed' do
      @taskII.mark_as_complete!
      expect(@taskII.complete?).to eq(true)
    end
  end

end



describe 'TodoList' do
  before do
    list = Todolist.new
    list.tasks = [Task.new, Task.new, Task.new]
  end

  describe '#initialize' do
    it 'should have a title' do
      list.title = 'Title'
      expect(list.title).to eq('Title')
    end

    it 'should have many tasks' do
      expect(list.tasks).to be_a Array
    end
  end


  describe '#add_task' do
    it 'should add a task to list.tasks' do
      expect{ list.add_task(Task.new) }.to change{ list.tasks.length }.by(1)
    end
  end

  describe '#complete_all!' do
    it 'should complete all tasks in a Todo List' do
      list.complete_all!
      list.tasks.each do |task|
        expect(task.complete?).to eq(true)
      end
    end
  end

  describe '#complete?' do
    it 'should show if all the tasks are completed in a Todo List' do
      list.complete_all
      expect(list.complete?).to eq(true)
    end
  end

  describe '#completed_tasks' do
    it 'should return an array of completed tasks from a Todo list' do
      expect(list.completed_tasks.length).to eq(0)
      list.complete_all
      expect(list.completed_tasks.length).to eq(list.tasks.length)
    end
  end

  describe '#incomplete_tasks' do
    it 'should return an array of incomplete tasks from a Todo list' do
      expect(list.incomplete_tasks.length).to eq(list.task.length)
      list.complete_all
      expect(list.incomplete_tasks.length).to eq(0)
    end
  end
end
