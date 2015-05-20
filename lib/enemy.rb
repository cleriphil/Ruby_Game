class Enemy < ActiveRecord::Base
  define_method(:chop_number_of_times) do |number|
    number.times() do
      @new_name = self.name
      @new_name = @new_name.chop()
      self.update({:name => @new_name})
    end
    self.name
  end
end
