require 'rails_helper'

RSpec.describe "eventos/index", type: :view do
  before(:each) do
    assign(:eventos, [
      Evento.create!(
        :nome => "Nome",
        :canal => "Canal",
        :estado => "Estado",
        :cidade => "Cidade",
        :aprovado => ""
      ),
      Evento.create!(
        :nome => "Nome",
        :canal => "Canal",
        :estado => "Estado",
        :cidade => "Cidade",
        :aprovado => ""
      )
    ])
  end

  it "renders a list of eventos" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Canal".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
