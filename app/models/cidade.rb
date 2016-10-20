class Cidade < ApplicationRecord
  belongs_to :estado
  has_many :eventos
end
