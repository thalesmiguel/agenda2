require 'rails_helper'

RSpec.describe "observacoes/index", type: :view do
  before(:each) do
    assign(:observacoes, [
      Observacao.create!(
        :descricao => "Descricao",
        :ano => "Ano",
        :mes => "Mes"
      ),
      Observacao.create!(
        :descricao => "Descricao",
        :ano => "Ano",
        :mes => "Mes"
      )
    ])
  end

  it "renders a list of observacoes" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Ano".to_s, :count => 2
    assert_select "tr>td", :text => "Mes".to_s, :count => 2
  end
end
