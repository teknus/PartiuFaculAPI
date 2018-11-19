require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User null camps" do
    user = User.new
    assert_not user.save, "All null Camps"
  end

  test "valid user" do 
    user = User.create(
        login: "tk",
        password: "812938",
        email: "ma@hl.com",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Afonso",
        sobrenome: "Mateus",
        tipodeusuario: "aluno"
        )
    assert user.valid?
  end 

  test "invalid without login" do
    user = User.create(
        password: "812938",
        email: "ma@hl.com",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Afonso",
        sobrenome: "Mateus",
        tipodeusuario: "aluno"
        )
    assert_not user.valid?
  end

  test "invalid without password" do
    user = User.create(
        login: "tk",
        email: "ma@hl.com",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Afonso",
        sobrenome: "Mateus",
        tipodeusuario: "aluno"
        )
    assert_not user.valid?
  end
  test "invalid with short passoword" do 
    user = User.create(
        login: "tk",
        password: "88",
        email: "ma@hl.com",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Afonso",
        sobrenome: "Mateus",
        tipodeusuario: "aluno"
        )
    assert_not user.valid?
  end

  test "invalid without email" do
    user = User.create(
        login: "tk",
        password: "812938",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Afonso",
        sobrenome: "Mateus",
        tipodeusuario: "aluno"
        )
    assert_not user.valid?
  end

  test "invalid without cpf" do
    user = User.create(
        login: "tk",
        password: "812938",
        email: "ma@hl.com",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Afonso",
        sobrenome: "Mateus",
        tipodeusuario: "aluno"
        )
    assert_not user.valid?
  end 

  test "invalid without nome" do 
    user = User.create(
        login: "tk",
        password: "812938",
        email: "ma@hl.com",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        sobrenome: "Mateus",
        tipodeusuario: "aluno"
        )
    assert_not user.valid?
  end 

  test "invalid without sobrenome" do 
    user = User.create(
        login: "tk",
        password: "812938",
        email: "ma@hl.com",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Mateus",
        tipodeusuario: "aluno"
        )
    assert_not user.valid?
  end 

  test "invalid without tipodeusuario" do 
    user = User.create(
        login: "tk",
        password: "812938",
        email: "ma@hl.com",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Afonso",
        sobrenome: "Mateus"
        )
    assert_not user.valid?
  end 

end
