require 'rails_helper'

RSpec.describe "observacoes/show", type: :view do
  before(:each) do
    @observacao = assign(:observacao, Observacao.create!(
      :descricao => "Descricao",
      :ano => "Ano",
      :mes => "Mes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/Ano/)
    expect(rendered).to match(/Mes/)
  end
end
