require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(
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
  end
  test "User null camps" do
    user = User.new
    assert_not user.save, "All null Camps"
  end

  test "valid user" do 
   assert @user.valid?
  end 

  test "invalid without login" do
    @user.login = nil
    assert_not @user.valid?
  end

  test "invalid without password" do
    @user.password = nil
    assert_not @user.valid?
  end
  test "invalid with short passowrd" do 
    @user.password = "88"
    assert_not @user.valid?
  end

  test "invalid without email" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "invalid without cpf" do
    @user.cpf = nil
    assert_not @user.valid?
  end 

  test "invalid without nome" do 
    @user.nome = nil
    assert_not @user.valid?
  end 

  test "invalid without sobrenome" do 
    @user.sobrenome = nil
    assert_not @user.valid?
  end 

  test "invalid without tipodeusuario" do 
    @user.tipodeusuario = nil
    assert_not @user.valid?
  end 

end
