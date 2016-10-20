require 'rails_helper'

RSpec.describe "eventos/edit", type: :view do
  before(:each) do
    @evento = assign(:evento, Evento.create!(
      :nome => "MyString",
      :canal => "MyString",
      :estado => "MyString",
      :cidade => "MyString",
      :aprovado => ""
    ))
  end

  it "renders the edit evento form" do
    render

    assert_select "form[action=?][method=?]", evento_path(@evento), "post" do

      assert_select "input#evento_nome[name=?]", "evento[nome]"

      assert_select "input#evento_canal[name=?]", "evento[canal]"

      assert_select "input#evento_estado[name=?]", "evento[estado]"

      assert_select "input#evento_cidade[name=?]", "evento[cidade]"

      assert_select "input#evento_aprovado[name=?]", "evento[aprovado]"
    end
  end
end
