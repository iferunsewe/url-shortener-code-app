class Url < ApplicationRecord

  def self.generate_random_alpha_numeric_string
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    (0..5).map{ range.sample }.join
  end
end
