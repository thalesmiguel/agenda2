require 'rails_helper'

RSpec.describe "eventos/new", type: :view do
  before(:each) do
    assign(:evento, Evento.new(
      :nome => "MyString",
      :canal => "MyString",
      :estado => "MyString",
      :cidade => "MyString",
      :aprovado => ""
    ))
  end

  it "renders new evento form" do
    render

    assert_select "form[action=?][method=?]", eventos_path, "post" do

      assert_select "input#evento_nome[name=?]", "evento[nome]"

      assert_select "input#evento_canal[name=?]", "evento[canal]"

      assert_select "input#evento_estado[name=?]", "evento[estado]"

      assert_select "input#evento_cidade[name=?]", "evento[cidade]"

      assert_select "input#evento_aprovado[name=?]", "evento[aprovado]"
    end
  end
end
