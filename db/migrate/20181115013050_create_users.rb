class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :email
      t.string :cpf
      t.string :endereco
      t.string :matricula
      t.string :nome
      t.string :sobrenome
      t.string :tipodeusuario

      t.timestamps
    end
  end
end
