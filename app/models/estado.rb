class Estado < ApplicationRecord
  has_many :cidades
  has_many :eventos, :through => :cidades


  def sigla_nome
    sigla + " - " + nome
  end
end
