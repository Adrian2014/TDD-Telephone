require_relative('Todo')

describe 'task' do

  before do
      task = Task.new(:title => "Title", :description => "description", :status => "complete", :created_at => '0805951')
  end

  it 'A task should have attribute title'  do
    expect(task.title).to be "Title"
  end

  it 'A task should have attribute description'  do
    expect(task.description).to be "description"
  end

  it 'A task should have attribute status'  do
    expect(task.status).to be "complete"
  end

  it 'A task should have attribute status'  do
    expect(task.created_at).to be '0805951'
  end
end

