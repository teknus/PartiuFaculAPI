class User < ApplicationRecord
    validates :login, presence: true, uniqueness: true
    validates :password, presence: true, length: { in: 6..30}
    validates :email, presence: true
    validates :nome, presence: true
    validates :sobrenome, presence: true
    validates :endereco, presence: true
    validates :cpf, presence: true
    validates :tipodeusuario, presence: true
end
