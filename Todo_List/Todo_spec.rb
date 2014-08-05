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

  it 'A task should have attribute created_at'  do
    expect(@task.created_at).to eq '0805951'
  end


  it 'A task should have a default status of incomplete'  do
    @taskII = Task.new(:title => "Title", :description => "description", :created_at => '0805951')
    expect(@taskII.status).to eq 'incomplete'
  end

   it 'A tasks created_at timestamp should be automatically set on initialization'  do
    @taskII = Task.new(:title => "Title", :description => "description")
    expect(@taskII.created_at).not_to be_nil
  end

end

