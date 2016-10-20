require 'rails_helper'

RSpec.describe "eventos/show", type: :view do
  before(:each) do
    @evento = assign(:evento, Evento.create!(
      :nome => "Nome",
      :canal => "Canal",
      :estado => "Estado",
      :cidade => "Cidade",
      :aprovado => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Canal/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/Cidade/)
    expect(rendered).to match(//)
  end
end
