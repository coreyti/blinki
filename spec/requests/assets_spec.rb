require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a asset exists" do
  Asset.all.destroy!
  request(resource(:assets), :method => "POST", 
    :params => { :asset => { :id => nil }})
end

describe "resource(:assets)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:assets))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of assets" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a asset exists" do
    before(:each) do
      @response = request(resource(:assets))
    end
    
    it "has a list of assets" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Asset.all.destroy!
      @response = request(resource(:assets), :method => "POST", 
        :params => { :asset => { :id => nil }})
    end
    
    it "redirects to resource(:assets)" do
      @response.should redirect_to(resource(Asset.first), :message => {:notice => "asset was successfully created"})
    end
    
  end
end

describe "resource(@asset)" do 
  describe "a successful DELETE", :given => "a asset exists" do
     before(:each) do
       @response = request(resource(Asset.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:assets))
     end

   end
end

describe "resource(:assets, :new)" do
  before(:each) do
    @response = request(resource(:assets, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@asset, :edit)", :given => "a asset exists" do
  before(:each) do
    @response = request(resource(Asset.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@asset)", :given => "a asset exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Asset.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @asset = Asset.first
      @response = request(resource(@asset), :method => "PUT", 
        :params => { :asset => {:id => @asset.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@asset))
    end
  end
  
end

