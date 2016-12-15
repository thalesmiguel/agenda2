require 'rails_helper'

RSpec.describe "observacoes/edit", type: :view do
  before(:each) do
    @observacao = assign(:observacao, Observacao.create!(
      :descricao => "MyString",
      :ano => "MyString",
      :mes => "MyString"
    ))
  end

  it "renders the edit observacao form" do
    render

    assert_select "form[action=?][method=?]", observacao_path(@observacao), "post" do

      assert_select "input#observacao_descricao[name=?]", "observacao[descricao]"

      assert_select "input#observacao_ano[name=?]", "observacao[ano]"

      assert_select "input#observacao_mes[name=?]", "observacao[mes]"
    end
  end
end
