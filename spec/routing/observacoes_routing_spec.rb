require "rails_helper"

RSpec.describe ObservacoesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/observacoes").to route_to("observacoes#index")
    end

    it "routes to #new" do
      expect(:get => "/observacoes/new").to route_to("observacoes#new")
    end

    it "routes to #show" do
      expect(:get => "/observacoes/1").to route_to("observacoes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/observacoes/1/edit").to route_to("observacoes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/observacoes").to route_to("observacoes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/observacoes/1").to route_to("observacoes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/observacoes/1").to route_to("observacoes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/observacoes/1").to route_to("observacoes#destroy", :id => "1")
    end

  end
end
