require 'spec_helper'

describe BuildingsController do


  before (:each) do
    @user = FactoryGirl.create(:user)
    @user.add_role(:admin)
    sign_in @user
  end

  let(:valid_attributes) { { name: 'Data', abbreviation: 'ED', rooms: 1, floors:1 } }

  describe "GET index" do
    it "assigns all buildings as @buildings" do
      building = Building.create! valid_attributes
      get :index, {}
      assigns(:buildings).should eq([building])
    end
  end

  describe "GET show" do
    it "assigns the requested building as @building" do
      building = Building.create! valid_attributes
      get :show, {:id => building.to_param}
      assigns(:building).should eq(building)
    end
  end

  describe "GET new" do
    it "assigns a new building as @building" do
      get :new, {}
      assigns(:building).should be_a_new(Building)
    end
  end

  describe "GET edit" do
    it "assigns the requested building as @building" do
      building = Building.create! valid_attributes
      get :edit, {:id => building.to_param}
      assigns(:building).should eq(building)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Building" do
        expect {
          post :create, {:building => valid_attributes}
        }.to change(Building, :count).by(1)
      end

      it "assigns a newly created building as @building" do
        post :create, {:building => valid_attributes}
        assigns(:building).should be_a(Building)
        assigns(:building).should be_persisted
      end

      it "redirects to the created building" do
        post :create, {:building => valid_attributes}
        response.should redirect_to(Building.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved building as @building" do
        # Trigger the behavior that occurs when invalid params are submitted
        Building.any_instance.stub(:save).and_return(false)
        post :create, {:building => { "name" => "invalid value" }}
        assigns(:building).should be_a_new(Building)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Building.any_instance.stub(:save).and_return(false)
        post :create, {:building => { "name" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested building" do
        building = Building.create! valid_attributes
        # Assuming there are no other buildings in the database, this
        # specifies that the Building created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Building.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => building.to_param, :building => { "name" => "MyString" }}
      end

      it "assigns the requested building as @building" do
        building = Building.create! valid_attributes
        put :update, {:id => building.to_param, :building => valid_attributes}
        assigns(:building).should eq(building)
      end

      it "redirects to the building" do
        building = Building.create! valid_attributes
        put :update, {:id => building.to_param, :building => valid_attributes}
        response.should redirect_to(building)
      end
    end

    describe "with invalid params" do
      it "assigns the building as @building" do
        building = Building.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Building.any_instance.stub(:save).and_return(false)
        put :update, {:id => building.to_param, :building => { "name" => "invalid value" }}
        assigns(:building).should eq(building)
      end

      it "re-renders the 'edit' template" do
        building = Building.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Building.any_instance.stub(:save).and_return(false)
        put :update, {:id => building.to_param, :building => { "name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested building" do
      building = Building.create! valid_attributes
      expect {
        delete :destroy, {:id => building.to_param}
      }.to change(Building, :count).by(-1)
    end

    it "redirects to the buildings list" do
      building = Building.create! valid_attributes
      delete :destroy, {:id => building.to_param}
      response.should redirect_to(buildings_url)
    end
  end

end
