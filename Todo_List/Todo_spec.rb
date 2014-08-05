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

