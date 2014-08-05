require_relative('Todo')

describe 'task' do

  before do
      @task = Task.new(:title => "Title", :description => "description", :status => "complete", :created_at => '0805951')
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
    @taskII = Task.new(:title => "Title", :description => "description", :created_at => '0805951')
    expect(@taskII.status).to eq 'incomplete'
  end

  it 'should automatically set a created_at timestamp on initialization'  do
    @taskII = Task.new(:title => "Title", :description => "description")
    expect(@taskII.created_at).not_to be_nil
  end

  it 'should have a method mark_as_complete! which sets its status to complete'

  it 'should have a method mark_as_incomplete! which sets its status to incomplete'

  it 'should have a method complete? which returns a boolean indicating whether or not it has been completed'
end

