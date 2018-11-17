class CreateHorarios < ActiveRecord::Migration[5.2]
  def change
    create_table :horarios do |t|
      t.date :data
      t.integer :turno
      t.string :embarque
      t.integer :presenca
      t.string :diasemana

      t.timestamps
    end
  end
end
