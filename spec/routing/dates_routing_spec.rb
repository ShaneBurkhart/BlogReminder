require "spec_helper"

describe DatesController do
  describe "routing" do

    it "routes to #index" do
      get("/dates").should route_to("dates#index")
    end

    it "routes to #new" do
      get("/dates/new").should route_to("dates#new")
    end

    it "routes to #show" do
      get("/dates/1").should route_to("dates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dates/1/edit").should route_to("dates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dates").should route_to("dates#create")
    end

    it "routes to #update" do
      put("/dates/1").should route_to("dates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dates/1").should route_to("dates#destroy", :id => "1")
    end

  end
end
