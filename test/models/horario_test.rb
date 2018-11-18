require 'test_helper'

class HorarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Horario null camps" do
    horario = Horario.new
    assert_not horario.save, "All null Camps"
  end
end
