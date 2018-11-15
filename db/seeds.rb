# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
        login: "tk",
        password: "812938",
        email: "ma@hl.com",
        cpf: "00228916097",
        endereco: "Rua da Maritaca nº 373, Alto dos Gigantes, Russas, CE",
        matricula: "9090",
        nome: "Afonso",
        sobrenome: "Mateus",
        tipodeusuario: "aluno",
)

Horario.create(
   data:Date.new(2008, 5, 12),
   turno:1,
   embarque:"Flores",
    presenca:0,
)