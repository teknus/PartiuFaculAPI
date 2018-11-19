require 'test_helper'

class HorarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "invalid without all camps" do
    horario = Horario.new
    assert_not horario.save, "Presence of all camps"
  end
  
  test "invalid with negative turno" do
    horario = Horario.create(  
    data:Date.new(2008, 5, 12),
    turno:-1,
    embarque:"Flores",
    presenca:0,
    )
    assert_not horario.valid? , "Must be in range 1..3"
  end

  test "invalid without data" do
    horario = Horario.create(  
    turno:1,
    embarque:"Flores",
    presenca:0,
    )
    assert_not horario.valid? , "Must be a date attribute"
  end

  test "invalid without turno" do
    horario = Horario.create( 
    data:Date.new(2008, 5, 12),
    embarque:"Flores",
    presenca:0,
    )
    assert_not horario.valid? , "Must have a turno attribute"
  end

  test "invalid without embarque" do
    horario = Horario.create(  
    data:Date.new(2008, 5, 12),
    turno:1,
    presenca:0,
    )
    assert_not horario.valid? , "Must be in embarque attribute"
  end

  test "invalid without presenca" do
    horario = Horario.create(  
    data:Date.new(2008, 5, 12),
    turno:-1,
    embarque:"Flores",
    )
    assert_not horario.valid? , "Must have presenca attribute"
  end
  
end
