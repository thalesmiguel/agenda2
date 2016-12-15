require 'rails_helper'

RSpec.describe "observacoes/new", type: :view do
  before(:each) do
    assign(:observacao, Observacao.new(
      :descricao => "MyString",
      :ano => "MyString",
      :mes => "MyString"
    ))
  end

  it "renders new observacao form" do
    render

    assert_select "form[action=?][method=?]", observacoes_path, "post" do

      assert_select "input#observacao_descricao[name=?]", "observacao[descricao]"

      assert_select "input#observacao_ano[name=?]", "observacao[ano]"

      assert_select "input#observacao_mes[name=?]", "observacao[mes]"
    end
  end
end
