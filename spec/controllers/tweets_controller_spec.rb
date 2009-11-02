require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TweetsController do
  before do
    @tweet = mock_model(Tweet)
    Tweet.stub!(:find).and_return([@tweet])    
  end
  
  def do_get
    get :index
  end
  
  it "routes the index to root" do
    route_for(:controller => 'tweets', :action => 'index').should == '/'
  end
  
  it "request to index is successful" do
    do_get
    response.should be_success 
  end
  
  it "receives a method to find all tweets" do
    @tweet.should_receive(:find).with(:all, :order => 'status_created_at DESC', :limit => 30).and_return([@tweet])
    do_get
    
  end
  
end
