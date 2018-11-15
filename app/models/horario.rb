class Horario < ApplicationRecord
    validates :data, presence: true
    validates :embarque, presence: true
    validates :diasemana, presence: true
    validates :turno, presence: true
    validates :presenca, presence: true, :numericality => { :presenca => 0 }
end
