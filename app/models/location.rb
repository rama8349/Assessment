
require 'csv'
class Location < ApplicationRecord
	before_create :generate_token

  validates :hash_id, uniqueness: true

  # This method used to generate unique hash code  
  def generate_token(length=20)
    self.hash_id = SecureRandom.urlsafe_base64(length, false)
    loop do
      self.hash_id = SecureRandom.urlsafe_base64(length, false)
      break hash_id unless self.class.exists?(hash_id: hash_id)
    end
  end


 
  def self.to_csv
    attributes = %w{city address}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |location|
        csv << attributes.map{ |attr| location.send(attr) }
      end
    end
  end
end
