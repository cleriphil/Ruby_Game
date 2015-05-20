require 'spec_helper'

describe(Enemy) do
  describe('#chop_number_of_times') do
    it('chop the name and update') do
      enemy = Enemy.create({:name => 'Niliathan'})
      enemy.chop_number_of_times(4)
      expect(enemy.name).to(eq('Nilia'))
    end
  end
end
