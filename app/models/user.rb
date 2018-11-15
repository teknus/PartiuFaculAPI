class User < ApplicationRecord
    validates :login, presence: true, uniqueness: true
    validates :password, presence: true, length: { in: 6..20 }
    validates :email, presence: true
    validates :nome, presence: true
    validates :sobrenome, presence: true
    validates :endereco, presence: true
    validates :cpf, presence: true
end
