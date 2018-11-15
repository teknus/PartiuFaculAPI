class AddDiasemanaToHorarios < ActiveRecord::Migration[5.2]
  def change
    add_column :horarios, :diasemana, :string
  end
end
