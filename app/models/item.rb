class Item < ApplicationRecord
  def available_amounts
    (1..amount).to_a.reverse
  end
end
