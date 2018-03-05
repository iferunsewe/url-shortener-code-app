class Url < ApplicationRecord
  validates_presence_of :original

  def self.generate_random_alpha_numeric_string(number)
    number_of_chars = number - 1
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    (0..number_of_chars).map{ range.sample }.join
  end
end
