require 'test_helper'

class HorarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @horario = Horario.create(  
      data:Date.new(2008, 5, 12),
      turno:1,
      embarque:"Flores",
      presenca:0,
      diasemana: "seg",
      )
  end

  test "valid horario" do
    assert @horario.valid?
  end
  
  test "invalid with negative turno" do
    @horario.turno = -1
    assert @horario.valid? , "Must be in range 1..3"
  end

  test "invalid without data" do
    @horario.data = nil
    assert_not @horario.valid? , "Must be a date attribute"
  end

  test "invalid without turno" do
    @horario.turno = nil 
    assert_not @horario.valid? , "Must have a turno attribute"
  end

  test "invalid without embarque" do
    @horario.embarque = nil
    assert_not @horario.valid? , "Must be in embarque attribute"
  end

  test "invalid without presenca" do
    @horario.presenca = nil
    assert_not @horario.valid? , "Must have presenca attribute"
  end
  
end
