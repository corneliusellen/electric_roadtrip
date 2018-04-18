class Vehicle < ApplicationRecord
  belongs_to :user

  def charge_120
    if charge120 == 0
      "n/a"
    else
      "#{charge120} hours"
    end
  end

  def charge_240
    if charge240 == 0
      "n/a"
    else
      "#{charge240} hours"
    end
  end

end
