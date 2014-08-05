require_relative('Todo')

describe 'task' do

  before do
      @task = Task.new(:title => "Title", :description => "description", :status => "complete", :created_at => '0805951')
  end

  it 'A task should have attribute title'  do
    expect(@task.title).to eq "Title"
  end

  it 'A task should have attribute description'  do
    expect(@task.description).to eq "description"
  end

  it 'A task should have attribute status'  do
    expect(@task.status).to eq "complete"
  end

  it 'A task should have attribute status'  do
    expect(@task.created_at).to eq '0805951'
  end
end

