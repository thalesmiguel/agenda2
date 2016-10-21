class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   enum usuario_tipo: [
     :comum,
     :pode_incluir,
     :admin
   ]

   def administrador?
     admin == 2 ? true : false
   end

   def pode_incluir?
     admin == 1 || admin == 2 ? true : false
   end
end
