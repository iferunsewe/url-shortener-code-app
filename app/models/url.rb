class Url < ApplicationRecord

  def self.generate_random_alpha_numeric_string
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    (0..5).map{ range.sample }.join
  end

  def self.find_original_url(short_url)
    Url.find_by(shortened: "http://#{short_url}")
  end
end
